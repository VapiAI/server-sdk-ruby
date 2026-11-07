# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardGoalSummaryDto < Internal::Types::Model
      field :registered_call_count, -> { Integer }, optional: false, nullable: false, api_name: "registeredCallCount"
      field :eligible_call_count, -> { Integer }, optional: false, nullable: false, api_name: "eligibleCallCount"
      field :ineligible_call_count, -> { Integer }, optional: false, nullable: false, api_name: "ineligibleCallCount"
      field :unassessed_call_count, -> { Integer }, optional: false, nullable: false, api_name: "unassessedCallCount"
      field :goal_met_count, -> { Integer }, optional: false, nullable: false, api_name: "goalMetCount"
      field :goal_not_met_count, -> { Integer }, optional: false, nullable: false, api_name: "goalNotMetCount"
      field :evaluated_call_count, -> { Integer }, optional: false, nullable: false, api_name: "evaluatedCallCount"
      field :analyzed_call_count, -> { Integer }, optional: false, nullable: false, api_name: "analyzedCallCount"
      field :goal_met_rate, -> { Integer }, optional: true, nullable: false, api_name: "goalMetRate"
      field :goal_not_met_rate, -> { Integer }, optional: true, nullable: false, api_name: "goalNotMetRate"
    end
  end
end
