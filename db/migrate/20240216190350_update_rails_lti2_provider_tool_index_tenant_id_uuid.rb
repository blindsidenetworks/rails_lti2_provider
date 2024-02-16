# frozen_string_literal: true

class UpdateRailsLti2ProviderToolIndexTenantIdUuid < ActiveRecord::Migration[6.1]
  def self.up
    add_index('rails_lti2_provider_tools', %w[tenant_id uuid], name: 'index_tenant_id_uuid', unique: true)
    remove_index('rails_lti2_provider_tools', ['uuid'])
  end

  def self.down
    add_index('rails_lti2_provider_tools', ['uuid'], name: 'index_uuid', unique: true)
    remove_index('rails_lti2_provider_tools', %w[tenant_id uuid]) if index_exists?(:tenant_id, :uuid)
  end
end
