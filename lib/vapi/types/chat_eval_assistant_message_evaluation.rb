# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalAssistantMessageEvaluation < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalAssistantMessageEvaluationRole }, optional: false, nullable: false
      field :judge_plan, -> { Vapi::Types::ChatEvalAssistantMessageEvaluationJudgePlan }, optional: false, nullable: false, api_name: "judgePlan"
      field :continue_plan, -> { Vapi::Types::AssistantMessageEvaluationContinuePlan }, optional: true, nullable: false, api_name: "continuePlan"
    end
  end
end
