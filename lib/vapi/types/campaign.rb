# frozen_string_literal: true

module Vapi
  module Types
    # A saved outbound calling campaign, including its calling configuration, schedule, status, customers, calls, and
    # call-progress counters.
    class Campaign < Internal::Types::Model
      field :status, -> { Vapi::Types::CampaignStatus }, optional: false, nullable: false
      field :ended_reason, -> { Vapi::Types::CampaignEndedReason }, optional: true, nullable: false, api_name: "endedReason"
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
      field :server_messages, -> { Internal::Types::Array[Vapi::Types::CampaignServerMessagesItem] }, optional: true, nullable: false, api_name: "serverMessages"
      field :predial_plan, -> { Vapi::Types::CampaignPredialPlan }, optional: true, nullable: false, api_name: "predialPlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :calls, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :calls_counter_scheduled, -> { Integer }, optional: false, nullable: false, api_name: "callsCounterScheduled"
      field :calls_counter_queued, -> { Integer }, optional: false, nullable: false, api_name: "callsCounterQueued"
      field :calls_counter_in_progress, -> { Integer }, optional: false, nullable: false, api_name: "callsCounterInProgress"
      field :calls_counter_ended_voicemail, -> { Integer }, optional: false, nullable: false, api_name: "callsCounterEndedVoicemail"
      field :calls_counter_ended, -> { Integer }, optional: false, nullable: false, api_name: "callsCounterEnded"
    end
  end
end
