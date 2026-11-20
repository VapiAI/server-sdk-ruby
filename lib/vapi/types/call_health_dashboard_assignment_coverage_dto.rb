# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssignmentCoverageDto < Internal::Types::Model
      field :pending, -> { Integer }, optional: false, nullable: false
      field :unmatched, -> { Integer }, optional: false, nullable: false
      field :skipped, -> { Integer }, optional: false, nullable: false
      field :unavailable, -> { Integer }, optional: false, nullable: false
      field :error, -> { Integer }, optional: false, nullable: false
      field :coverage_gap_count, -> { Integer }, optional: false, nullable: false, api_name: "coverageGapCount"
    end
  end
end
