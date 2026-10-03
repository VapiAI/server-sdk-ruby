# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      module SimulationRunControllerFindItemsRequestStatus
        extend Vapi::Internal::Types::Enum

        QUEUED = "queued"
        RUNNING = "running"
        EVALUATING = "evaluating"
        PASSED = "passed"
        FAILED = "failed"
        CANCELED = "canceled"
      end
    end
  end
end
