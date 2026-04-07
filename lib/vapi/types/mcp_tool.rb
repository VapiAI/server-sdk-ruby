# frozen_string_literal: true

module Vapi
  module Types
    class McpTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessagesItem] }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :tool_messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessages] }, optional: true, nullable: false, api_name: "toolMessages"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :metadata, -> { Vapi::Types::McpToolMetadata }, optional: true, nullable: false
    end
  end
end
