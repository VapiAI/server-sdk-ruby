# frozen_string_literal: true

module Vapi
  module Types
    class GoalEvaluationCurrentBatchResponseDto < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::GoalEvaluationCurrentCallResponseDto] }, optional: false, nullable: false
    end
  end
end
