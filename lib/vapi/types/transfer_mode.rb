# frozen_string_literal: true

module Vapi
  module Types
    module TransferMode
      extend Vapi::Internal::Types::Enum

      ROLLING_HISTORY = "rolling-history"
      SWAP_SYSTEM_MESSAGE_IN_HISTORY = "swap-system-message-in-history"
    end
  end
end
