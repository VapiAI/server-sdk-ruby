# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaPronunciationDictItem < Internal::Types::Model
      field :text, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"
    end
  end
end
