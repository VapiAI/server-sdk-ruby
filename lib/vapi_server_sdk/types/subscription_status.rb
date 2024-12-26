# frozen_string_literal: true

module Vapi
  # This is the status of the subscription. Past due subscriptions are subscriptions
  #  with past due payments.
  class SubscriptionStatus
    ACTIVE = "active"
    FROZEN = "frozen"
  end
end
