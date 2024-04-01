# frozen_string_literal: true

class AddStatusToTools < ActiveRecord::Migration[6.1]
  def self.up
    add_column(:rails_lti2_provider_tools, :status, :integer, null: false, default: 0)
    RailsLti2Provider::Tool.update_all(status: 'enabled') # rubocop:disable Rails/SkipsModelValidations
  end

  def self.down
    remove_column(:rails_lti2_provider_tools, :status)
  end
end
