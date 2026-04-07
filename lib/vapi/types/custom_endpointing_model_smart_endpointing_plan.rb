# frozen_string_literal: true

module Vapi
  module Types
    class CustomEndpointingModelSmartEndpointingPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::CustomEndpointingModelSmartEndpointingPlanProvider }, optional: false, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
