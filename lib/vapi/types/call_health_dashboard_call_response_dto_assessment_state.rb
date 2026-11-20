# frozen_string_literal: true

module Vapi
  module Types
    module CallHealthDashboardCallResponseDtoAssessmentState
      extend Vapi::Internal::Types::Enum

      PENDING = "pending"
      UNAVAILABLE = "unavailable"
      SKIPPED = "skipped"
      ERROR = "error"
      EXCLUDED = "excluded"
      COMPLETE = "complete"
      PARTIAL = "partial"
    end
  end
end
