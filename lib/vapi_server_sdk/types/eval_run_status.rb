# frozen_string_literal: true

module Vapi
  # This is the status of the eval run. When an eval run is created, the status is
  #  'running'.
  #  When the eval run is completed, the status is 'ended'.
  class EvalRunStatus
    RUNNING = "running"
    ENDED = "ended"
    QUEUED = "queued"
  end
end
