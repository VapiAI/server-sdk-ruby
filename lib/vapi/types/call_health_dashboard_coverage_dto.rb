# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardCoverageDto < Internal::Types::Model
      field :as_of, -> { String }, optional: false, nullable: false, api_name: "asOf"
      field :intake, -> { Vapi::Types::CallHealthDashboardIntakeCoverageDto }, optional: false, nullable: false
      field :goal, -> { Vapi::Types::CallHealthDashboardGoalGapsDto }, optional: false, nullable: false
      field :classification, -> { Vapi::Types::CallHealthDashboardClassificationCoverageDto }, optional: false, nullable: false
      field :assignment, -> { Vapi::Types::CallHealthDashboardAssignmentCoverageDto }, optional: false, nullable: false
      field :discovery, -> { Vapi::Types::CallHealthDashboardDiscoveryCoverageDto }, optional: false, nullable: false
      field :sweep, -> { Vapi::Types::CallHealthDashboardSweepCoverageDto }, optional: false, nullable: false
      field :counts_complete, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "countsComplete"
    end
  end
end
