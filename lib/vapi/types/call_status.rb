# frozen_string_literal: true

module Vapi
  # This is the status of the call.
  class CallStatus
    QUEUED = "queued"
    RINGING = "ringing"
    IN_PROGRESS = "in-progress"
    FORWARDING = "forwarding"
    ENDED = "ended"
  end
end
