# frozen_string_literal: true

module Vapi
  module Types
    # The value of the parameter. Any JSON type. String values support Liquid templates.
    class ToolParameterValue < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Integer }
      member -> { Internal::Types::Boolean }
      member -> { Internal::Types::Hash[String, Object] }
      member -> { Internal::Types::Array[Object] }
    end
  end
end
