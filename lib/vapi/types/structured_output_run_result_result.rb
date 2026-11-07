# frozen_string_literal: true

module Vapi
  module Types
    # This is the extracted value, shaped by the structured output's schema.
    class StructuredOutputRunResultResult < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Integer }
      member -> { Internal::Types::Boolean }
      member -> { Internal::Types::Hash[String, Object] }
      member -> { Internal::Types::Array[Object] }
    end
  end
end
