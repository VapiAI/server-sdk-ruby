# frozen_string_literal: true

module Vapi
  module Types
    module JsonSchemaType
      extend Vapi::Internal::Types::Enum

      STRING = "string"
      NUMBER = "number"
      INTEGER = "integer"
      BOOLEAN = "boolean"
      ARRAY = "array"
      OBJECT = "object"
    end
  end
end
