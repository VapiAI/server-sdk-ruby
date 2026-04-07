# frozen_string_literal: true

module Vapi
  module Types
    class UpdateMcpToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateMcpToolDtoMessagesItem] }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :tool_messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessages] }, optional: true, nullable: false, api_name: "toolMessages"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :metadata, -> { Vapi::Types::McpToolMetadata }, optional: true, nullable: false
    end
  end
end
