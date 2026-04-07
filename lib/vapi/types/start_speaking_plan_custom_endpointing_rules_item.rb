# frozen_string_literal: true

module Vapi
  module Types
    class StartSpeakingPlanCustomEndpointingRulesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::AssistantCustomEndpointingRule }, key: "ASSISTANT"
      member -> { Vapi::Types::CustomerCustomEndpointingRule }, key: "CUSTOMER"
      member -> { Vapi::Types::BothCustomEndpointingRule }, key: "BOTH"
    end
  end
end
