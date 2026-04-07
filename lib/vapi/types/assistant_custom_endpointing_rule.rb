# frozen_string_literal: true

module Vapi
  module Types
    class AssistantCustomEndpointingRule < Internal::Types::Model
      field :regex, -> { String }, optional: false, nullable: false
      field :regex_options, -> { Internal::Types::Array[Vapi::Types::RegexOption] }, optional: true, nullable: false, api_name: "regexOptions"
      field :timeout_seconds, -> { Integer }, optional: false, nullable: false, api_name: "timeoutSeconds"
    end
  end
end
