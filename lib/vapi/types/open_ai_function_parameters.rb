# frozen_string_literal: true

module Vapi
  module Types
    # JSON object schema defining the properties accepted by a function and which properties are required.
    class OpenAiFunctionParameters < Internal::Types::Model
      field :type, -> { Vapi::Types::OpenAiFunctionParametersType }, optional: false, nullable: false
      field :properties, -> { Internal::Types::Hash[String, Vapi::Types::JsonSchema] }, optional: false, nullable: false
      field :required, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
