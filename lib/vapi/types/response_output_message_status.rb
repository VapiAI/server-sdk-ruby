# frozen_string_literal: true

module Vapi
  module Types
    module ResponseOutputMessageStatus
      extend Vapi::Internal::Types::Enum

      IN_PROGRESS = "in_progress"
      COMPLETED = "completed"
      INCOMPLETE = "incomplete"
    end
  end
end
