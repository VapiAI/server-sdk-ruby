# frozen_string_literal: true

module Vapi
  module Types
    class BashToolWithToolCall < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::BashToolWithToolCallMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::BashToolWithToolCallSubType }, optional: false, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :tool_call, -> { Vapi::Types::ToolCall }, optional: false, nullable: false, api_name: "toolCall"
      field :name, -> { Vapi::Types::BashToolWithToolCallName }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
