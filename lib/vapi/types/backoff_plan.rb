# frozen_string_literal: true

module Vapi
  module Types
    class BackoffPlan < Internal::Types::Model
      field :type, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :max_retries, -> { Integer }, optional: false, nullable: false, api_name: "maxRetries"
      field :base_delay_seconds, -> { Integer }, optional: false, nullable: false, api_name: "baseDelaySeconds"
      field :excluded_status_codes, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "excludedStatusCodes"
    end
  end
end
