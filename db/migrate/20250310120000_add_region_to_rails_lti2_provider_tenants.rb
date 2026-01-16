# frozen_string_literal: true

class AddRegionToRailsLti2ProviderTenants < ActiveRecord::Migration[6.1]
  def change
    add_column :rails_lti2_provider_tenants, :region, :string
  end
end
