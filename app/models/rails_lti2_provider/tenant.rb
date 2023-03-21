# frozen_string_literal: true

module RailsLti2Provider
  class Tenant < ApplicationRecord
    has_many :tools, dependent: :restrict_with_exception

    setting_keys = [
        :bigbluebutton_endpoint,
        :bigbluebutton_secret,
        :bigbluebutton_moderator_roles,
        :bigbluebutton_recording_public_formats,
        :handler_legacy_patterns,
        :handler_legacy_api_endpoint,
        :handler_legacy_api_secret,
        :handler_legacy_new_room_enabled,
      ]

    store_accessor :settings, setting_keys

    def setting(key, default_value = nil)
      self.settings[key.to_sym].presence || default_value.presence
    end
  end
end
