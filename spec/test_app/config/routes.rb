# frozen_string_literal: true

Rails.application.routes.draw do
  post '/register', to: 'registration#register'

  mount RailsLti2Provider::Engine => '/rails_lti2_provider', as: :rails_lti2_provider
end
