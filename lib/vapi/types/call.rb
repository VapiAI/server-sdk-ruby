# frozen_string_literal: true

module Vapi
  module Types
    class Call < Internal::Types::Model
      field :type, -> { Vapi::Types::CallType }, optional: true, nullable: false
      field :costs, -> { Internal::Types::Array[Vapi::Types::CallCostsItem] }, optional: true, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::CallMessagesItem] }, optional: true, nullable: false
      field :phone_call_provider, -> { Vapi::Types::CallPhoneCallProvider }, optional: true, nullable: false, api_name: "phoneCallProvider"
      field :phone_call_transport, -> { Vapi::Types::CallPhoneCallTransport }, optional: true, nullable: false, api_name: "phoneCallTransport"
      field :status, -> { Vapi::Types::CallStatus }, optional: true, nullable: false
      field :ended_reason, -> { Vapi::Types::CallEndedReason }, optional: true, nullable: false, api_name: "endedReason"
      field :ended_message, -> { String }, optional: true, nullable: false, api_name: "endedMessage"
      field :destination, -> { Vapi::Types::CallDestination }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :started_at, -> { String }, optional: true, nullable: false, api_name: "startedAt"
      field :ended_at, -> { String }, optional: true, nullable: false, api_name: "endedAt"
      field :cost, -> { Integer }, optional: true, nullable: false
      field :cost_breakdown, -> { Vapi::Types::CostBreakdown }, optional: true, nullable: false, api_name: "costBreakdown"
      field :artifact_plan, -> { Vapi::Types::ArtifactPlan }, optional: true, nullable: false, api_name: "artifactPlan"
      field :analysis, -> { Vapi::Types::Analysis }, optional: true, nullable: false
      field :monitor, -> { Vapi::Types::Monitor }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :compliance, -> { Vapi::Types::Compliance }, optional: true, nullable: false
      field :phone_call_provider_id, -> { String }, optional: true, nullable: false, api_name: "phoneCallProviderId"
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :workflow, -> { Vapi::Types::CreateWorkflowDto }, optional: true, nullable: false
      field :workflow_overrides, -> { Vapi::Types::WorkflowOverrides }, optional: true, nullable: false, api_name: "workflowOverrides"
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :phone_number, -> { Vapi::Types::ImportTwilioPhoneNumberDto }, optional: true, nullable: false, api_name: "phoneNumber"
      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :schedule_plan, -> { Vapi::Types::SchedulePlan }, optional: true, nullable: false, api_name: "schedulePlan"
      field :transport, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
