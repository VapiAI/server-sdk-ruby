# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalToolResponseMessageEvaluation < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalToolResponseMessageEvaluationRole }, optional: false, nullable: false
      field :judge_plan, -> { Vapi::Types::AssistantMessageJudgePlanAi }, optional: false, nullable: false, api_name: "judgePlan"
    end
  end
end
