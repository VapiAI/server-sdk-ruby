# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueDailyDto < Internal::Types::Model
      field :date, -> { String }, optional: false, nullable: false
      field :affected_call_count, -> { Integer }, optional: false, nullable: false, api_name: "affectedCallCount"
      field :analyzed_call_count, -> { Integer }, optional: false, nullable: false, api_name: "analyzedCallCount"
      field :affected_call_rate, -> { Integer }, optional: true, nullable: false, api_name: "affectedCallRate"
    end
  end
end
