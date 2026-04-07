# frozen_string_literal: true

module Vapi
  module Types
    module TransferAssistantModelProvider
      extend Vapi::Internal::Types::Enum

      OPENAI = "openai"
      ANTHROPIC = "anthropic"
      GOOGLE = "google"
      CUSTOM_LLM = "custom-llm"
    end
  end
end
