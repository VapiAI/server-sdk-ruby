# frozen_string_literal: true

module Vapi
  module Types
    class CallMessagesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::UserMessage }
      member -> { Vapi::Types::SystemMessage }
      member -> { Vapi::Types::BotMessage }
      member -> { Vapi::Types::ToolCallMessage }
      member -> { Vapi::Types::ToolCallResultMessage }
    end
  end
end
