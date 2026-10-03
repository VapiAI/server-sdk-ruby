# frozen_string_literal: true

module Vapi
  module Types
    class OrgApiLimitsDto < Internal::Types::Model
      field :rate_limit_usage, -> { Integer }, optional: false, nullable: false, api_name: "rateLimitUsage"
      field :rate_limit_max, -> { Integer }, optional: false, nullable: false, api_name: "rateLimitMax"
    end
  end
end
