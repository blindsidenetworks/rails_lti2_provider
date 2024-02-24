# frozen_string_literal: true

class AddStatusToTenants < ActiveRecord::Migration[6.1]
  def self.up
    add_column(:rails_lti2_provider_tenants, :status, :integer, null: false, default: 0)
  end

  def self.down
    remove_column(:rails_lti2_provider_tenants, :status)
  end
end
