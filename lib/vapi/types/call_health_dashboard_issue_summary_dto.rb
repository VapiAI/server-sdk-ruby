# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueSummaryDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :status, -> { Vapi::Types::CallHealthDashboardIssueSummaryDtoStatus }, optional: false, nullable: false
      field :row_version, -> { Integer }, optional: false, nullable: false, api_name: "rowVersion"
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :summary, -> { String }, optional: false, nullable: false
      field :assistant, -> { Vapi::Types::CallHealthDashboardAssistantReferenceDto }, optional: false, nullable: false
      field :affected_call_count, -> { Integer }, optional: false, nullable: false, api_name: "affectedCallCount"
      field :analyzed_call_count, -> { Integer }, optional: false, nullable: false, api_name: "analyzedCallCount"
      field :affected_call_rate, -> { Integer }, optional: true, nullable: false, api_name: "affectedCallRate"
      field :daily_series, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardIssueDailyDto] }, optional: false, nullable: false, api_name: "dailySeries"
      field :last_seen_at, -> { String }, optional: true, nullable: false, api_name: "lastSeenAt"
      field :coverage, -> { Vapi::Types::CallHealthDashboardIssueCoverageDto }, optional: false, nullable: false
    end
  end
end
