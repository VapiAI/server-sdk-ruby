# frozen_string_literal: true

module Vapi
  module Types
    # Selects Vapi smart endpointing to determine when customer speech is complete.
    class VapiSmartEndpointingPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::VapiSmartEndpointingPlanProvider }, optional: false, nullable: false
    end
  end
end
