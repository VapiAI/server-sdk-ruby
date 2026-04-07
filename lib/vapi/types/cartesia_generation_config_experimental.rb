# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaGenerationConfigExperimental < Internal::Types::Model
      field :accent_localization, -> { Integer }, optional: true, nullable: false, api_name: "accentLocalization"
    end
  end
end
