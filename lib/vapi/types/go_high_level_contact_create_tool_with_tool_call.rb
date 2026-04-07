# frozen_string_literal: true

module Vapi
  module Types
    class GoHighLevelContactCreateToolWithToolCall < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::GoHighLevelContactCreateToolWithToolCallMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::GoHighLevelContactCreateToolWithToolCallType }, optional: false, nullable: false
      field :tool_call, -> { Vapi::Types::ToolCall }, optional: false, nullable: false, api_name: "toolCall"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
