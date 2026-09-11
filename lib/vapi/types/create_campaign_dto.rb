# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create an outbound calling campaign. Choose an assistant, squad, or workflow, then provide
    # customers, phone-number or dial-plan settings, and an optional schedule.
    class CreateCampaignDto < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :dial_plan, -> { Internal::Types::Array[Vapi::Types::DialPlanEntry] }, optional: true, nullable: false, api_name: "dialPlan"
      field :schedule_plan, -> { Vapi::Types::SchedulePlan }, optional: true, nullable: false, api_name: "schedulePlan"
      field :customers, -> { Internal::Types::Array[Vapi::Types::CreateCustomerDto] }, optional: true, nullable: false
      field :max_concurrency, -> { Integer }, optional: true, nullable: false, api_name: "maxConcurrency"
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :server_messages, -> { Internal::Types::Array[Vapi::Types::CreateCampaignDtoServerMessagesItem] }, optional: true, nullable: false, api_name: "serverMessages"
      field :predial_plan, -> { Vapi::Types::CampaignPredialPlan }, optional: true, nullable: false, api_name: "predialPlan"
      field :duplicate_from_campaign_id, -> { String }, optional: true, nullable: false, api_name: "duplicateFromCampaignId"
    end
  end
end
