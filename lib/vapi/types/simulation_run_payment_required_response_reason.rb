# frozen_string_literal: true

module Vapi
  module Types
    module SimulationRunPaymentRequiredResponseReason
      extend Vapi::Internal::Types::Enum

      WALLET_MISSING = "wallet_missing"
      SUBSCRIPTION_FROZEN = "subscription_frozen"
      PAYMENT_METHOD_MISSING = "payment_method_missing"
      INSUFFICIENT_CREDITS = "insufficient_credits"
      BILLING_LIMIT = "billing_limit"
      INITIAL_PAYMENT_MISSING = "initial_payment_missing"
    end
  end
end
