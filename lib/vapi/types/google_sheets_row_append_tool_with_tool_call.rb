# frozen_string_literal: true

module Vapi
  module Types
    class GoogleSheetsRowAppendToolWithToolCall < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::GoogleSheetsRowAppendToolWithToolCallMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::GoogleSheetsRowAppendToolWithToolCallType }, optional: false, nullable: false
      field :tool_call, -> { Vapi::Types::ToolCall }, optional: false, nullable: false, api_name: "toolCall"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
