# frozen_string_literal: true

class UpdateToolProxySharedSecret < ActiveRecord::Migration[4.2]
  def change
    change_column :rails_lti2_provider_tools, :shared_secret, :text, limit: nil
  end
end
