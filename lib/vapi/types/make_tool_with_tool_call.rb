# frozen_string_literal: true

module Vapi
  module Types
    class MakeToolWithToolCall < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::MakeToolWithToolCallMessagesItem] }, optional: true, nullable: false
      field :tool_call, -> { Vapi::Types::ToolCall }, optional: false, nullable: false, api_name: "toolCall"
      field :metadata, -> { Vapi::Types::MakeToolMetadata }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
