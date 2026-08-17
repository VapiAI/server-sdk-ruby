# frozen_string_literal: true

module Vapi
  module Types
    # Per-tool message overrides for a tool discovered through an MCP server.
    class McpToolMessages < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessagesMessagesItem] }, optional: true, nullable: false
    end
  end
end
