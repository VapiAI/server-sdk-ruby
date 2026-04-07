# frozen_string_literal: true

module Vapi
  module Types
    class ComputerToolWithToolCall < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::ComputerToolWithToolCallMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::ComputerToolWithToolCallSubType }, optional: false, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :tool_call, -> { Vapi::Types::ToolCall }, optional: false, nullable: false, api_name: "toolCall"
      field :name, -> { Vapi::Types::ComputerToolWithToolCallName }, optional: false, nullable: false
      field :display_width_px, -> { Integer }, optional: false, nullable: false, api_name: "displayWidthPx"
      field :display_height_px, -> { Integer }, optional: false, nullable: false, api_name: "displayHeightPx"
      field :display_number, -> { Integer }, optional: true, nullable: false, api_name: "displayNumber"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
