# frozen_string_literal: true

module Vapi
  module Types
    # Organization concurrency limits and remaining concurrent call capacity.
    class SubscriptionLimits < Internal::Types::Model
      field :concurrency_blocked, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "concurrencyBlocked"
      field :concurrency_limit, -> { Integer }, optional: true, nullable: false, api_name: "concurrencyLimit"
      field :remaining_concurrent_calls, -> { Integer }, optional: true, nullable: false, api_name: "remainingConcurrentCalls"
    end
  end
end
