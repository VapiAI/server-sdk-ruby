# frozen_string_literal: true

module Vapi
  module Types
    class GoalEvaluationCurrentCallResponseDto < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false, api_name: "callId"
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :current_goal_version, -> { String }, optional: true, nullable: false, api_name: "currentGoalVersion"
      field :current_evaluation, -> { Vapi::Types::GoalEvaluationCurrentDto }, optional: true, nullable: false, api_name: "currentEvaluation"
    end
  end
end
