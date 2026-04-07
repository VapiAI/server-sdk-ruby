# frozen_string_literal: true

module Vapi
  module Types
    # This is the judge plan that instructs how to evaluate the assistant message.
    # The assistant message can be evaluated against fixed content (exact match or RegEx) or with an LLM-as-judge by
    # defining the evaluation criteria in a prompt.
    class ChatEvalAssistantMessageEvaluationJudgePlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::AssistantMessageJudgePlanExact }, key: "EXACT"
      member -> { Vapi::Types::AssistantMessageJudgePlanRegex }, key: "REGEX"
      member -> { Vapi::Types::AssistantMessageJudgePlanAi }, key: "AI"
    end
  end
end
