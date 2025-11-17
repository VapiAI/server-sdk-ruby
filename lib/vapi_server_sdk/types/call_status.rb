# frozen_string_literal: true

module Vapi
  # This is the status of the call.
  class CallStatus
    SCHEDULED = "scheduled"
    QUEUED = "queued"
    RINGING = "ringing"
    IN_PROGRESS = "in-progress"
    FORWARDING = "forwarding"
    ENDED = "ended"
    NOT_FOUND = "not-found"
    DELETION_FAILED = "deletion-failed"
  end
end
