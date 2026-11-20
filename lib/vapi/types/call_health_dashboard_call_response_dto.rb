# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardCallResponseDto < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false, api_name: "callId"
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :assistant_version_id, -> { String }, optional: true, nullable: false, api_name: "assistantVersionId"
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
      field :assessment_state, -> { Vapi::Types::CallHealthDashboardCallResponseDtoAssessmentState }, optional: false, nullable: false, api_name: "assessmentState"
      field :primary_category_key, -> { String }, optional: true, nullable: false, api_name: "primaryCategoryKey"
      field :other_category_keys, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "otherCategoryKeys"
      field :issues, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardCallIssueDto] }, optional: false, nullable: false
    end
  end
end
