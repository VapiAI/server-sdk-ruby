# frozen_string_literal: true

module Vapi
  module Types
    # A hook action that invokes an inline tool or an existing tool when the hook triggers.
    class ToolCallHookAction < Internal::Types::Model
      field :type, -> { Vapi::Types::ToolCallHookActionType }, optional: false, nullable: false
      field :tool, -> { Vapi::Types::ToolCallHookActionTool }, optional: true, nullable: false
      field :tool_id, -> { String }, optional: true, nullable: false, api_name: "toolId"
    end
  end
end
