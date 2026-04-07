# frozen_string_literal: true

module Vapi
  module Types
    # This is the message the assistant will deliver to the customer if the transfer fails.
    class TransferFallbackPlanMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Vapi::Types::CustomMessage }
    end
  end
end
