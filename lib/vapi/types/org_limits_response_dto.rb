# frozen_string_literal: true

module Vapi
  module Types
    class OrgLimitsResponseDto < Internal::Types::Model
      field :subscription_limits, -> { Vapi::Types::OrgConcurrencyLimitsDto }, optional: true, nullable: false, api_name: "subscriptionLimits"
      field :api_limits, -> { Vapi::Types::OrgApiLimitsDto }, optional: true, nullable: false, api_name: "apiLimits"
    end
  end
end
