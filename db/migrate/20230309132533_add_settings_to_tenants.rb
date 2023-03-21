# frozen_string_literal: true

class AddSettingsToTenants < ActiveRecord::Migration[6.1]
  def self.up
    add_column(:rails_lti2_provider_tenants, :settings, :jsonb, null: false, default: {})
  end

  def self.down
    remove_column(:rails_lti2_provider_tenants, :settings)
  end
end
