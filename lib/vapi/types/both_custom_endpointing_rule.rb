# frozen_string_literal: true

module Vapi
  module Types
    class BothCustomEndpointingRule < Internal::Types::Model
      field :assistant_regex, -> { String }, optional: false, nullable: false, api_name: "assistantRegex"
      field :assistant_regex_options, -> { Internal::Types::Array[Vapi::Types::RegexOption] }, optional: true, nullable: false, api_name: "assistantRegexOptions"
      field :customer_regex, -> { String }, optional: false, nullable: false, api_name: "customerRegex"
      field :customer_regex_options, -> { Internal::Types::Array[Vapi::Types::RegexOption] }, optional: true, nullable: false, api_name: "customerRegexOptions"
      field :timeout_seconds, -> { Integer }, optional: false, nullable: false, api_name: "timeoutSeconds"
    end
  end
end
