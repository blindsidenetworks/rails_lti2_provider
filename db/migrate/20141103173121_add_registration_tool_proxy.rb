class AddRegistrationToolProxy < ActiveRecord::Migration[4.2]
  def change
    add_column :rails_lti2_provider_registrations, :tool_proxy_id, :integer
  end
end
