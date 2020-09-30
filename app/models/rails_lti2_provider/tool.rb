# frozen_string_literal: true

module RailsLti2Provider
  class Tool < ApplicationRecord
    validates :shared_secret, :uuid, :tool_settings, :lti_version, presence: true
    serialize :tool_settings
    belongs_to :tenant, inverse_of: :tools
    has_many :lti_launches, dependent: :restrict_with_exception
    has_many :registrations, dependent: :restrict_with_exception

    def tool_proxy
      IMS::LTI::Models::ToolProxy.from_json(tool_settings)
    end

    def self.find_by_issuer(issuer, options = {})
      if options.any?
        Rails.logger.warn(options.inspect)
        Tool.where(uuid: issuer).find_each do |tool|
          tool_settings = JSON.parse(tool.tool_settings)
          match = true
          options.each do |key, _value|
            match = false if tool_settings[key] != options[key]
          end
          return tool if match
        end
        nil
      else
        Tool.find_by(uuid: issuer)
      end
    end
  end
end
