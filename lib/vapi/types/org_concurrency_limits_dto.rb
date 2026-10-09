# frozen_string_literal: true

module Vapi
  module Types
    class OrgConcurrencyLimitsDto < Internal::Types::Model
      field :concurrency_blocked, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "concurrencyBlocked"
      field :concurrency_limit, -> { Integer }, optional: false, nullable: false, api_name: "concurrencyLimit"
      field :remaining_concurrent_calls, -> { Integer }, optional: false, nullable: false, api_name: "remainingConcurrentCalls"
    end
  end
end
