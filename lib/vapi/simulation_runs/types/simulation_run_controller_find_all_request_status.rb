# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      module SimulationRunControllerFindAllRequestStatus
        extend Vapi::Internal::Types::Enum

        QUEUED = "queued"
        RUNNING = "running"
        ENDED = "ended"
      end
    end
  end
end
