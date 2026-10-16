# frozen_string_literal: true

module Vapi
  module Types
    # Enables Anthropic extended thinking with a maximum thinking-token budget.
    class AnthropicThinkingConfig < Internal::Types::Model
      field :type, -> { Vapi::Types::AnthropicThinkingConfigType }, optional: false, nullable: false
      field :budget_tokens, -> { Integer }, optional: false, nullable: false, api_name: "budgetTokens"
    end
  end
end
