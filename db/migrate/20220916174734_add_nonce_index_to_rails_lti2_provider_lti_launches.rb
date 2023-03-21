# frozen_string_literal: true

class AddNonceIndexToRailsLti2ProviderLtiLaunches < ActiveRecord::Migration[6.1]
  def change
    add_index('rails_lti2_provider_lti_launches', %w[nonce], name: 'index_launch_nonce', unique: true)
  end
end
