# frozen_string_literal: true

module Vapi
  module Types
    module TransferArtifactStatus
      extend Vapi::Internal::Types::Enum

      CONNECTED = "connected"
      NO_ANSWER = "no-answer"
      BUSY = "busy"
      VOICEMAIL = "voicemail"
      FAILED = "failed"
      COMPLETED = "completed"
      CANCELLED = "cancelled"
    end
  end
end
