# frozen_string_literal: true

class AddRailsLti2ProviderToolDeploymentId < ActiveRecord::Migration[6.0]
  def change
    add_column(:rails_lti2_provider_tools, :deployment_id, :text)
  end
end
