# frozen_string_literal: true

module Vapi
  module Types
    # A custom endpointing rule that matches the customer's current speech and applies a configured timeout.
    class CustomerCustomEndpointingRule < Internal::Types::Model
      field :regex, -> { String }, optional: false, nullable: false
      field :regex_options, -> { Internal::Types::Array[Vapi::Types::RegexOption] }, optional: true, nullable: false, api_name: "regexOptions"
      field :timeout_seconds, -> { Integer }, optional: false, nullable: false, api_name: "timeoutSeconds"
    end
  end
end
