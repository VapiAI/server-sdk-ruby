# frozen_string_literal: true

module Vapi
  module Types
    module SubscriptionType
      extend Vapi::Internal::Types::Enum

      PAY_AS_YOU_GO = "pay-as-you-go"
      ENTERPRISE = "enterprise"
      AGENCY = "agency"
      STARTUP = "startup"
      GROWTH = "growth"
      SCALE = "scale"
    end
  end
end
