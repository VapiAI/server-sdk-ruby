# frozen_string_literal: true

module Vapi
  module Types
    # The result of a batch call creation request, containing successfully created calls, per-call failures, and
    # subscription limits recorded at the end of the batch.
    class CallBatchResponse < Internal::Types::Model
      field :subscription_limits, -> { Vapi::Types::SubscriptionLimits }, optional: true, nullable: false, api_name: "subscriptionLimits"
      field :results, -> { Internal::Types::Array[Vapi::Types::Call] }, optional: false, nullable: false
      field :errors, -> { Internal::Types::Array[Vapi::Types::CallBatchError] }, optional: false, nullable: false
    end
  end
end
