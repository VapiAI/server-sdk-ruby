# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueVersionDto < Internal::Types::Model
      field :assistant_version_id, -> { String }, optional: false, nullable: true, api_name: "assistantVersionId"
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
      field :affected_call_count, -> { Integer }, optional: false, nullable: false, api_name: "affectedCallCount"
      field :analyzed_call_count, -> { Integer }, optional: false, nullable: false, api_name: "analyzedCallCount"
      field :affected_call_rate, -> { Integer }, optional: true, nullable: false, api_name: "affectedCallRate"
    end
  end
end
