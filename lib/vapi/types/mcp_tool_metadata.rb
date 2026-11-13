# frozen_string_literal: true

module Vapi
  module Types
    # Protocol metadata used to communicate with an MCP server.
    class McpToolMetadata < Internal::Types::Model
      field :protocol, -> { Vapi::Types::McpToolMetadataProtocol }, optional: true, nullable: false
    end
  end
end
