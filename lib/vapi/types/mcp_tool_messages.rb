# frozen_string_literal: true

module Vapi
  module Types
    class McpToolMessages < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessagesMessagesItem] }, optional: true, nullable: false
    end
  end
end
