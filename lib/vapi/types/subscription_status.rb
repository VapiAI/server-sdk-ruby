# frozen_string_literal: true

module Vapi
  module Types
    module SubscriptionStatus
      extend Vapi::Internal::Types::Enum

      ACTIVE = "active"
      FROZEN = "frozen"
      BLOCKED = "blocked"
    end
  end
end
