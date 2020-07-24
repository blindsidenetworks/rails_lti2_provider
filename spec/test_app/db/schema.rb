# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_151_204_000_125) do
  create_table 'rails_lti2_provider_lti_launches', force: :cascade do |t|
    t.integer 'tool_id', limit: 8
    t.string 'nonce'
    t.text 'message'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'rails_lti2_provider_registrations', force: :cascade do |t|
    t.string 'uuid'
    t.text 'registration_request_params'
    t.text 'tool_proxy_json'
    t.string 'workflow_state'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'tool_id', limit: 8
    t.text 'correlation_id'
    t.index ['correlation_id'], name: 'index_rails_lti2_provider_registrations_on_correlation_id', unique: true
  end

  create_table 'rails_lti2_provider_tools', force: :cascade do |t|
    t.string 'uuid'
    t.text 'shared_secret'
    t.text 'tool_settings'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'lti_version'
  end
end
