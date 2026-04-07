# frozen_string_literal: true

module Vapi
  module Types
    module EvalModelListOptionsProvider
      extend Vapi::Internal::Types::Enum

      OPENAI = "openai"
      ANTHROPIC = "anthropic"
      GOOGLE = "google"
      GROQ = "groq"
      CUSTOM_LLM = "custom-llm"
    end
  end
end
