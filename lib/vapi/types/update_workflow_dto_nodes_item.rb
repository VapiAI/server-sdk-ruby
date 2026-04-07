# frozen_string_literal: true

module Vapi
  module Types
    class UpdateWorkflowDtoNodesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ConversationNode }, key: "CONVERSATION"
      member -> { Vapi::Types::ToolNode }, key: "TOOL"
    end
  end
end
