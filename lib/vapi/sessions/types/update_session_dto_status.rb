# frozen_string_literal: true

module Vapi
  module Sessions
    module Types
      module UpdateSessionDtoStatus
        extend Vapi::Internal::Types::Enum

        ACTIVE = "active"
        COMPLETED = "completed"
      end
    end
  end
end
