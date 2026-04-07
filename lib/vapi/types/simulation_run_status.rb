# frozen_string_literal: true

module Vapi
  module Types
    module SimulationRunStatus
      extend Vapi::Internal::Types::Enum

      QUEUED = "queued"
      RUNNING = "running"
      ENDED = "ended"
    end
  end
end
