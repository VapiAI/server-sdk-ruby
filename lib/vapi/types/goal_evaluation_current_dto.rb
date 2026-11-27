# frozen_string_literal: true

module Vapi
  module Types
    class GoalEvaluationCurrentDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :goal_version, -> { String }, optional: false, nullable: false, api_name: "goalVersion"
      field :call_ended_at, -> { String }, optional: false, nullable: false, api_name: "callEndedAt"
      field :processing_state, -> { Vapi::Types::GoalEvaluationCurrentDtoProcessingState }, optional: false, nullable: false, api_name: "processingState"
      field :goal_outcome, -> { Vapi::Types::GoalEvaluationCurrentDtoGoalOutcome }, optional: true, nullable: false, api_name: "goalOutcome"
      field :assistant_version_id, -> { String }, optional: true, nullable: false, api_name: "assistantVersionId"
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
    end
  end
end
