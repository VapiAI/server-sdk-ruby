# frozen_string_literal: true

module Vapi
  module Types
    class GoHighLevelCalendarAvailabilityToolWithToolCall < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::GoHighLevelCalendarAvailabilityToolWithToolCallMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::GoHighLevelCalendarAvailabilityToolWithToolCallType }, optional: false, nullable: false
      field :tool_call, -> { Vapi::Types::ToolCall }, optional: false, nullable: false, api_name: "toolCall"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
