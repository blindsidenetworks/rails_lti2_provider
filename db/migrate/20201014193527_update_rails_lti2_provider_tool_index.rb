# frozen_string_literal: true

class UpdateRailsLti2ProviderToolIndex < ActiveRecord::Migration[6.1]
  def self.up
    add_index('rails_lti2_provider_tools', ['uuid'], name: 'index_uuid', unique: true)
    remove_index('rails_lti2_provider_tools', %w[id tenant_id]) if index_exists?(:id, :tenant_id)
  end

  def self.down
    add_index('rails_lti2_provider_tools', %w[id tenant_id], name: 'index_tool_id_tenant_id', unique: true)
    remove_index('rails_lti2_provider_tools', ['uuid'])
  end
end
