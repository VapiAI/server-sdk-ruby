# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutputCostBreakdown < Internal::Types::Model
      field :structured_output_id, -> { String }, optional: false, nullable: false, api_name: "structuredOutputId"
      field :name, -> { String }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
      field :prompt_tokens, -> { Integer }, optional: false, nullable: false, api_name: "promptTokens"
      field :completion_tokens, -> { Integer }, optional: false, nullable: false, api_name: "completionTokens"
      field :cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "cachedPromptTokens"
    end
  end
end
