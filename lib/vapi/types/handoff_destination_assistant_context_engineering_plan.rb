# frozen_string_literal: true

module Vapi
  module Types
    # This is the plan for manipulating the message context before handing off the call to the next assistant.
    class HandoffDestinationAssistantContextEngineeringPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ContextEngineeringPlanLastNMessages }, key: "LAST_N_MESSAGES"
      member -> { Vapi::Types::ContextEngineeringPlanNone }, key: "NONE"
      member -> { Vapi::Types::ContextEngineeringPlanAll }, key: "ALL"
      member -> { Vapi::Types::ContextEngineeringPlanUserAndAssistantMessages }, key: "USER_AND_ASSISTANT_MESSAGES"
    end
  end
end
