# frozen_string_literal: true

module Vapi
  module Types
    class CampaignSummary < Internal::Types::Model
      field :status, -> { Vapi::Types::CampaignSummaryStatus }, optional: false, nullable: false
      field :ended_reason, -> { Vapi::Types::CampaignSummaryEndedReason }, optional: true, nullable: false, api_name: "endedReason"
      field :name, -> { String }, optional: false, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :schedule_plan, -> { Vapi::Types::SchedulePlan }, optional: true, nullable: false, api_name: "schedulePlan"
      field :max_concurrency, -> { Integer }, optional: true, nullable: false, api_name: "maxConcurrency"
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :server_messages, -> { Internal::Types::Array[Vapi::Types::CampaignSummaryServerMessagesItem] }, optional: true, nullable: false, api_name: "serverMessages"
      field :predial_plan, -> { Vapi::Types::CampaignPredialPlan }, optional: true, nullable: false, api_name: "predialPlan"
      field :contact_counters, -> { Vapi::Types::CampaignContactCounters }, optional: true, nullable: false, api_name: "contactCounters"
      field :call_metrics, -> { Vapi::Types::CampaignCallMetrics }, optional: true, nullable: false, api_name: "callMetrics"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
