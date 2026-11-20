# frozen_string_literal: true

module Vapi
  module Types
    module SimulationRunListItemStatus
      extend Vapi::Internal::Types::Enum

      QUEUED = "queued"
      RUNNING = "running"
      ENDED = "ended"
    end
  end
end
