# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardGoalCallDto < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false, api_name: "callId"
      field :call_time, -> { String }, optional: false, nullable: false, api_name: "callTime"
      field :goal_version, -> { String }, optional: false, nullable: false, api_name: "goalVersion"
      field :processing_state, -> { Vapi::Types::CallHealthDashboardGoalCallDtoProcessingState }, optional: false, nullable: false, api_name: "processingState"
      field :goal_outcome, -> { Vapi::Types::CallHealthDashboardGoalCallDtoGoalOutcome }, optional: true, nullable: false, api_name: "goalOutcome"
      field :assistant_version_id, -> { String }, optional: true, nullable: false, api_name: "assistantVersionId"
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
      field :primary_category_key, -> { String }, optional: true, nullable: false, api_name: "primaryCategoryKey"
      field :issues, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardGoalCallIssueDto] }, optional: false, nullable: false
    end
  end
end
