# frozen_string_literal: true

module Vapi
  module Types
    module CreateSimulationRunResponseStatus
      extend Vapi::Internal::Types::Enum

      QUEUED = "queued"
      RUNNING = "running"
      ENDED = "ended"
    end
  end
end
