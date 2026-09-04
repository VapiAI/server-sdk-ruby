# frozen_string_literal: true

module Vapi
  module Types
    # Cartesia Sonic 3 generation controls, including accent localization.
    class CartesiaGenerationConfigExperimental < Internal::Types::Model
      field :accent_localization, -> { Integer }, optional: true, nullable: false, api_name: "accentLocalization"
    end
  end
end
