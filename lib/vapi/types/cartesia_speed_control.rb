# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaSpeedControl < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CartesiaSpeedControlZero }
      member -> { Integer }
    end
  end
end
