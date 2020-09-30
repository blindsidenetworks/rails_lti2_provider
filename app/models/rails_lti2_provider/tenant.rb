# frozen_string_literal: true

module RailsLti2Provider
  class Tenant < ApplicationRecord
    has_many :tools, dependent: :restrict_with_exception
  end
end
