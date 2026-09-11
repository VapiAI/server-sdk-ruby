# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for using a custom endpointing model, including its provider identifier and server connection.
    class CustomEndpointingModelSmartEndpointingPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::CustomEndpointingModelSmartEndpointingPlanProvider }, optional: false, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
