module RailsLti2Provider
  class Tenant < ApplicationRecord
    has_many :tools
  end
end
