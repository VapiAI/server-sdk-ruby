# frozen_string_literal: true

module Vapi
  module Types
    class StructuredDataPlan < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :schema, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
    end
  end
end
