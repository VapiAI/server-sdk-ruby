# frozen_string_literal: true

module Vapi
  module Types
    # Speaking-speed control expressed as a preset or a value from -1 to 1.
    class CartesiaSpeedControl < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CartesiaSpeedControlZero }
      member -> { Integer }
    end
  end
end
