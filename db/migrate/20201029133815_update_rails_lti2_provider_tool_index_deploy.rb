# frozen_string_literal: true

class UpdateRailsLti2ProviderToolIndexDeploy < ActiveRecord::Migration[6.0]
  def self.up
    add_index('rails_lti2_provider_tools', %w[uuid shared_secret deployment_id], name: 'index_deployment', unique: true)
    remove_index('rails_lti2_provider_tools', ['uuid'])
  end

  def self.down
    add_index('rails_lti2_provider_tools', ['uuid'], name: 'index_uuid', unique: true)
    remove_index('rails_lti2_provider_tools', %w[uuid shared_secret deployment_id])
  end
end
