# frozen_string_literal: true

module Vapi
  module Types
    class TransportCost < Internal::Types::Model
      field :provider, -> { Vapi::Types::TransportCostProvider }, optional: true, nullable: false
      field :minutes, -> { Integer }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
