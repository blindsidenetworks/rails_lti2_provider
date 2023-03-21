# frozen_string_literal: true

class AddExpirationDateToRailsLti2ProviderTool < ActiveRecord::Migration[6.1]
  def change
    add_column(:rails_lti2_provider_tools, :expired_at, :datetime)
  end
end
