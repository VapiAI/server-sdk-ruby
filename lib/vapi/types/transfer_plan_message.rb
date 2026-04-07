# frozen_string_literal: true

module Vapi
  module Types
    # This is the message the assistant will deliver to the destination party before connecting the customer.
    #
    # Usage:
    # - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`, `warm-transfer-say-message`,
    # `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`, or `warm-transfer-experimental`.
    class TransferPlanMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Vapi::Types::CustomMessage }
    end
  end
end
