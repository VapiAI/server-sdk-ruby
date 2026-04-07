# frozen_string_literal: true

module Vapi
  module Types
    module SimulationRunItemStatus
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
