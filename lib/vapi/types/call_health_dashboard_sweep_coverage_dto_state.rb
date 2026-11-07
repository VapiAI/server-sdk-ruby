# frozen_string_literal: true

module Vapi
  module Types
    module CallHealthDashboardSweepCoverageDtoState
      extend Vapi::Internal::Types::Enum

      IDLE = "idle"
      ENUMERATING = "enumerating"
      PROCESSING = "processing"
      DEDUPLICATING = "deduplicating"
      BLOCKED = "blocked"
    end
  end
end
