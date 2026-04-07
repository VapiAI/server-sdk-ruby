# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseAssistantRequest < Internal::Types::Model
      field :destination, -> { Vapi::Types::ServerMessageResponseAssistantRequestDestination }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :workflow, -> { Vapi::Types::CreateWorkflowDto }, optional: true, nullable: false
      field :workflow_overrides, -> { Vapi::Types::WorkflowOverrides }, optional: true, nullable: false, api_name: "workflowOverrides"
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
