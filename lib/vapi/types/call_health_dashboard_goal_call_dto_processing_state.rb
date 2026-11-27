# frozen_string_literal: true

module Vapi
  module Types
    module CallHealthDashboardGoalCallDtoProcessingState
      extend Vapi::Internal::Types::Enum

      PENDING = "pending"
      RUNNING = "running"
      PARKED = "parked"
      UNAVAILABLE = "unavailable"
      EXCLUDED = "excluded"
      COMPLETED = "completed"
    end
  end
end
