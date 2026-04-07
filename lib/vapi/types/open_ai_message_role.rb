# frozen_string_literal: true

module Vapi
  module Types
    module OpenAiMessageRole
      extend Vapi::Internal::Types::Enum

      ASSISTANT = "assistant"
      FUNCTION = "function"
      USER = "user"
      SYSTEM = "system"
      TOOL = "tool"
    end
  end
end
