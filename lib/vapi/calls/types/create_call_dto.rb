# frozen_string_literal: true

module Vapi
  module Calls
    module Types
      class CreateCallDto < Internal::Types::Model
        field :customers, -> { Internal::Types::Array[Vapi::Types::CreateCustomerDto] }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :schedule_plan, -> { Vapi::Types::SchedulePlan }, optional: true, nullable: false, api_name: "schedulePlan"
        field :transport, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
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
      end
    end
  end
end
