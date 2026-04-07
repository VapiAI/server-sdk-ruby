# frozen_string_literal: true

module Vapi
  module Types
    class JsonSchema < Internal::Types::Model
      field :type, -> { Vapi::Types::JsonSchemaType }, optional: false, nullable: false
      field :items, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :properties, -> { Internal::Types::Hash[String, Vapi::Types::JsonSchema] }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :pattern, -> { String }, optional: true, nullable: false
      field :format, -> { Vapi::Types::JsonSchemaFormat }, optional: true, nullable: false
      field :required, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :enum, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :title, -> { String }, optional: true, nullable: false
    end
  end
end
