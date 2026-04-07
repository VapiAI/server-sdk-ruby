# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaExperimentalControls < Internal::Types::Model
      field :speed, -> { Vapi::Types::CartesiaSpeedControl }, optional: true, nullable: false
      field :emotion, -> { Vapi::Types::CartesiaExperimentalControlsEmotion }, optional: true, nullable: false
    end
  end
end
