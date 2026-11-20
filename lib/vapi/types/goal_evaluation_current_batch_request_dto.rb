# frozen_string_literal: true

module Vapi
  module Types
    class GoalEvaluationCurrentBatchRequestDto < Internal::Types::Model
      field :evaluations, -> { Internal::Types::Array[Vapi::Types::GoalEvaluationCurrentCallRequestDto] }, optional: false, nullable: false
    end
  end
end
