# frozen_string_literal: true

module Vapi
  module Types
    class CreateMcpToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateMcpToolDtoMessagesItem] }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :tool_messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessages] }, optional: true, nullable: false, api_name: "toolMessages"
      field :metadata, -> { Vapi::Types::McpToolMetadata }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
