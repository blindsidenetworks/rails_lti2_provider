# frozen_string_literal: true

class UpdateRailsLti2ProviderUuidIndex < ActiveRecord::Migration[6.0]
  def self.up
    add_index('rails_lti2_provider_tools', ['uuid'], name: 'index_uuid', unique: true)
    add_index('rails_lti2_provider_tools', %w[tenant_id uuid], name: 'index_tool_uuid_tenant_id', unique: true)
    remove_index('rails_lti2_provider_tools', %w[id tenant_id])
  end

  def self.down
    add_index('rails_lti2_provider_tools', %w[id tenant_id], name: 'index_tool_id_tenant_id', unique: true)
    remove_index('rails_lti2_provider_tools', %w[tenant_id uuid])
    remove_index('rails_lti2_provider_tools', ['uuid'])
  end
end
