# frozen_string_literal: true

module Vapi
  # This is the current status of the test suite run.
  class TestSuiteRunStatus
    QUEUED = "queued"
    IN_PROGRESS = "in-progress"
    COMPLETED = "completed"
    FAILED = "failed"
  end
end
