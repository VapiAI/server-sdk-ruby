# frozen_string_literal: true

module Vapi
  module Types
    # This is the exact message to say. When a string array is provided, one is randomly selected.
    class SayHookActionExact < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[String] }
    end
  end
end
