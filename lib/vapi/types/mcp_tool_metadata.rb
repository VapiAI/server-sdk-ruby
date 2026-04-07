# frozen_string_literal: true

module Vapi
  module Types
    class McpToolMetadata < Internal::Types::Model
      field :protocol, -> { Vapi::Types::McpToolMetadataProtocol }, optional: true, nullable: false
    end
  end
end
