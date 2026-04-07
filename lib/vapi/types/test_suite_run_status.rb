# frozen_string_literal: true

module Vapi
  module Types
    module TestSuiteRunStatus
      extend Vapi::Internal::Types::Enum

      QUEUED = "queued"
      IN_PROGRESS = "in-progress"
      COMPLETED = "completed"
      FAILED = "failed"
    end
  end
end
