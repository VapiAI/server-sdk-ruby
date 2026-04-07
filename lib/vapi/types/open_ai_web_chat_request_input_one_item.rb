# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiWebChatRequestInputOneItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::SystemMessage }
      member -> { Vapi::Types::UserMessage }
      member -> { Vapi::Types::AssistantMessage }
      member -> { Vapi::Types::ToolMessage }
      member -> { Vapi::Types::DeveloperMessage }
    end
  end
end
