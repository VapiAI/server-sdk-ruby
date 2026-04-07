# frozen_string_literal: true

module Vapi
  module Types
    class StartSpeakingPlanSmartEndpointingEnabled < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Internal::Types::Boolean }
      member -> { Vapi::Types::StartSpeakingPlanSmartEndpointingEnabledOne }
    end
  end
end
