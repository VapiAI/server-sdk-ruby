# frozen_string_literal: true

module Vapi
  module Types
    # Generation controls for Cartesia Sonic 3 voices, including speed, volume, and accent localization.
    class CartesiaGenerationConfig < Internal::Types::Model
      field :speed, -> { Integer }, optional: true, nullable: false
      field :volume, -> { Integer }, optional: true, nullable: false
      field :experimental, -> { Vapi::Types::CartesiaGenerationConfigExperimental }, optional: true, nullable: false
    end
  end
end
