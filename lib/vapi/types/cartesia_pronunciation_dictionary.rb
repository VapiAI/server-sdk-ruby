# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaPronunciationDictionary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :owner_id, -> { String }, optional: false, nullable: false, api_name: "ownerId"
      field :pinned, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :items, -> { Internal::Types::Array[Vapi::Types::CartesiaPronunciationDictItem] }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
