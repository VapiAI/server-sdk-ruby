# frozen_string_literal: true

module Vapi
  module Types
    module ResponseObjectStatus
      extend Vapi::Internal::Types::Enum

      COMPLETED = "completed"
      FAILED = "failed"
      IN_PROGRESS = "in_progress"
      INCOMPLETE = "incomplete"
    end
  end
end
