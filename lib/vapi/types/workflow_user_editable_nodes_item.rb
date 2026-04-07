# frozen_string_literal: true

module Vapi
  module Types
    class WorkflowUserEditableNodesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ConversationNode }, key: "CONVERSATION"
      member -> { Vapi::Types::ToolNode }, key: "TOOL"
    end
  end
end
