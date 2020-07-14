# frozen_string_literal: true

module RailsLti2Provider
  class Tool < ActiveRecord::Base
    validates_presence_of :shared_secret, :uuid, :tool_settings, :lti_version
    serialize :tool_settings
    has_many :lti_launches
    has_many :registrations

    def tool_proxy
      IMS::LTI::Models::ToolProxy.from_json(tool_settings)
    end

    def self.find_by_issuer(issuer, options = {})
      if options.any?
        puts options.inspect
        Tool.where(uuid: issuer).each do |tool|
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
