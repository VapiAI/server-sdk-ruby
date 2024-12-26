# frozen_string_literal: true

module Vapi
  # This is the status of the payment
  class PaymentStatus
    PAST_DUE = "past-due"
    PENDING = "pending"
    FINALIZED = "finalized"
    REFUNDED = "refunded"
  end
end
