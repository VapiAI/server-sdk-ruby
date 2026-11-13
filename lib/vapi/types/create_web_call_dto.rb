# frozen_string_literal: true

module Vapi
  module Types
    class CreateWebCallDto < Internal::Types::Model
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
      field :squad_version, -> { String }, optional: true, nullable: false, api_name: "squadVersion"
      field :room_delete_on_user_leave_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "roomDeleteOnUserLeaveEnabled"
      field :video_recording_start_mode, -> { Vapi::Types::CreateWebCallDtoVideoRecordingStartMode }, optional: true, nullable: false, api_name: "videoRecordingStartMode"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::TransientAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :workflow, -> { Vapi::Types::CreateWorkflowDto }, optional: true, nullable: false
      field :workflow_overrides, -> { Vapi::Types::WorkflowOverrides }, optional: true, nullable: false, api_name: "workflowOverrides"
    end
  end
end
