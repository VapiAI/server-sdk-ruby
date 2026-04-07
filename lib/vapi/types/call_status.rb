# frozen_string_literal: true

module Vapi
  module Types
    module CallStatus
      extend Vapi::Internal::Types::Enum

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
end
