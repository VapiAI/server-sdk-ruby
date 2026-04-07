# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaSpeedControl < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CartesiaExperimentalControlsSpeedZero }
      member -> { Integer }
    end
  end
end
