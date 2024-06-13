# frozen_string_literal: true

require 'ims/lti'

module RailsLti2Provider
  class LtiLaunch < ApplicationRecord
    validates :tool_id, :nonce, presence: true
    belongs_to :tool
    serialize :message

    def self.check_launch(lti_message)
      tool = Tool.find_by_uuid(lti_message.oauth_consumer_key)
      raise Unauthorized, :invalid_key unless tool
      raise Unauthorized, :expired_key unless tool.expired_at.nil? || tool.expired_at > Time.now
      raise Unauthorized, :disabled_key if tool.disabled?

      # Split the shared_secret string into an array of secrets
      secrets = tool.shared_secret.split(',')

      # Iterate over each secret and check if the signature is valid
      valid_signature = secrets.any? do |secret|
        IMS::LTI::Services::MessageAuthenticator
          .new(lti_message.launch_url, lti_message.post_params.merge(lti_message.oauth_params), secret.strip)
          .valid_signature?
      end

      raise Unauthorized, :invalid_signature unless valid_signature
      raise Unauthorized, :invalid_nonce if tool.lti_launches.where(nonce: lti_message.oauth_nonce).count.positive?
      raise Unauthorized, :request_too_old if DateTime.strptime(lti_message.oauth_timestamp, '%s') < 5.minutes.ago

      Rails.logger.info("Removing the old launches from before #{1.day.ago}")
      tool.lti_launches.where('created_at < ?', 1.day.ago).delete_all
      launch = tool.lti_launches.create!(nonce: lti_message.oauth_nonce, message: lti_message.post_params)
      Rails.logger.info("Launch created launch=#{launch.inspect}")
      launch
    end

    def message
      IMS::LTI::Models::Messages::Message.generate(self[:message])
    end

    def jwt_body
      self[:message]
    end

    class Unauthorized < StandardError
      attr_reader :error

      def initialize(error = :unknown) # rubocop:disable Lint/MissingSuper
        @error = error
      end
    end
  end
end
