class CreateRailsLti2ProviderTenants < ActiveRecord::Migration[6.0]
  def self.up
    create_table :rails_lti2_provider_tenants, if_not_exists: true do |t|
      t.string :uid

      t.timestamps
    end
    add_index 'rails_lti2_provider_tenants', ['uid'], :name => 'index_tenant_uid', unique: true
  end

  def self.down
    remove_index 'rails_lti2_provider_tenants', ['uid']
    drop_table :rails_lti2_provider_tenants
  end
end
