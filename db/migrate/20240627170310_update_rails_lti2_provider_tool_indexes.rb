# frozen_string_literal: true

class UpdateRailsLti2ProviderToolIndexes < ActiveRecord::Migration[6.1]
  def up
    # Old indexes may or may not exist depending on DB history.
    remove_index :rails_lti2_provider_tools, name: "index_tool_id_tenant_id", if_exists: true
    remove_index :rails_lti2_provider_tools, name: "index_tenant_id",         if_exists: true
    remove_index :rails_lti2_provider_tools, name: "index_tenant_id_uuid",    if_exists: true

    # New indexes: guard against environments where they already exist.
    add_index :rails_lti2_provider_tools, :id,
              name: "index_id",
              if_not_exists: true

    add_index :rails_lti2_provider_tools, :uuid,
              name: "index_uuid",
              if_not_exists: true

    add_index :rails_lti2_provider_tools, [:uuid, :shared_secret],
              name: "index_uuid_shared_secret",
              if_not_exists: true
  end

  def down
    remove_index :rails_lti2_provider_tools, name: "index_uuid_shared_secret", if_exists: true
    remove_index :rails_lti2_provider_tools, name: "index_uuid",              if_exists: true
    remove_index :rails_lti2_provider_tools, name: "index_id",                if_exists: true

    add_index :rails_lti2_provider_tools, [:tenant_id, :uuid],
              name: "index_tenant_id_uuid",
              unique: true,
              if_not_exists: true

    add_index :rails_lti2_provider_tools, :tenant_id,
              name: "index_tenant_id",
              if_not_exists: true

    add_index :rails_lti2_provider_tools, [:id, :tenant_id],
              name: "index_tool_id_tenant_id",
              if_not_exists: true
  end
end
