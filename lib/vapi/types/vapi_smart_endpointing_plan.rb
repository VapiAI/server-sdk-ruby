# frozen_string_literal: true

module Vapi
  module Types
    class VapiSmartEndpointingPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::VapiSmartEndpointingPlanProvider }, optional: false, nullable: false
    end
  end
end
