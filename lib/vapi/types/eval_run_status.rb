# frozen_string_literal: true

module Vapi
  module Types
    module EvalRunStatus
      extend Vapi::Internal::Types::Enum

      RUNNING = "running"
      ENDED = "ended"
      QUEUED = "queued"
    end
  end
end
