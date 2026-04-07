# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaGenerationConfig < Internal::Types::Model
      field :speed, -> { Integer }, optional: true, nullable: false
      field :volume, -> { Integer }, optional: true, nullable: false
      field :experimental, -> { Vapi::Types::CartesiaGenerationConfigExperimental }, optional: true, nullable: false
    end
  end
end
