# frozen_string_literal: true

module Vapi
  module Types
    # This is the plan for smart endpointing. Pick between Vapi smart endpointing, LiveKit, or custom endpointing model
    # (or nothing). We strongly recommend using livekit endpointing when working in English. LiveKit endpointing is not
    # supported in other languages, yet.
    #
    # If this is set, it will override and take precedence over `transcriptionEndpointingPlan`.
    # This plan will still be overridden by any matching `customEndpointingRules`.
    #
    # If this is not set, the system will automatically use the transcriber's built-in endpointing capabilities if
    # available.
    class StartSpeakingPlanSmartEndpointingPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::VapiSmartEndpointingPlan }
      member -> { Vapi::Types::LivekitSmartEndpointingPlan }
      member -> { Vapi::Types::CustomEndpointingModelSmartEndpointingPlan }
    end
  end
end
