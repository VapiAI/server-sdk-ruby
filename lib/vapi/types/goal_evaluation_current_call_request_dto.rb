# frozen_string_literal: true

module Vapi
  module Types
    class GoalEvaluationCurrentCallRequestDto < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false, api_name: "callId"
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
    end
  end
end
