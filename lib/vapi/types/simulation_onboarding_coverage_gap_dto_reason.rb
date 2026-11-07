# frozen_string_literal: true

module Vapi
  module Types
    module SimulationOnboardingCoverageGapDtoReason
      extend Vapi::Internal::Types::Enum

      NOT_TESTABLE = "not-testable"
      UNMAPPED = "unmapped"
      FAILED = "failed"
      BUDGET = "budget"
    end
  end
end
