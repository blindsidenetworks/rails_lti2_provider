# frozen_string_literal: true

class UpdateRailsLti2ProviderToolIndexes < ActiveRecord::Migration[6.1]
  def self.up
    remove_index('rails_lti2_provider_tools', name: 'index_tool_id_tenant_id')
    remove_index('rails_lti2_provider_tools', name: 'index_tenant_id')
    remove_index('rails_lti2_provider_tools', name: 'index_tenant_id_uuid')
    add_index('rails_lti2_provider_tools', %w[id], name: 'index_id')
    add_index('rails_lti2_provider_tools', %w[uuid], name: 'index_uuid')
    add_index('rails_lti2_provider_tools', %w[uuid shared_secret], name: 'index_uuid_shared_secret')
  end

  def self.down
    remove_index('rails_lti2_provider_tools', name: 'index_uuid_shared_secret')
    remove_index('rails_lti2_provider_tools', name: 'index_uuid')
    remove_index('rails_lti2_provider_tools', name: 'index_id')
    add_index('rails_lti2_provider_tools', %w[tenant_id uuid], name: 'index_tenant_id_uuid', unique: true)
    add_index('rails_lti2_provider_tools', %w[tenant_id], name: 'index_tenant_id')
    add_index('rails_lti2_provider_tools', %w[id tenant_id], name: 'index_tool_id_tenant_id')
  end
end
