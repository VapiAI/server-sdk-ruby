# frozen_string_literal: true

module Vapi
  module Types
    class CallBatchResponse < Internal::Types::Model
      field :subscription_limits, -> { Vapi::Types::SubscriptionLimits }, optional: true, nullable: false, api_name: "subscriptionLimits"
      field :results, -> { Internal::Types::Array[Vapi::Types::Call] }, optional: false, nullable: false
      field :errors, -> { Internal::Types::Array[Vapi::Types::CallBatchError] }, optional: false, nullable: false
    end
  end
end
