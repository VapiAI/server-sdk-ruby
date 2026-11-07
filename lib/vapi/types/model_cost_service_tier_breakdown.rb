# frozen_string_literal: true

module Vapi
  module Types
    class ModelCostServiceTierBreakdown < Internal::Types::Model
      field :service_tier, -> { String }, optional: true, nullable: false, api_name: "serviceTier"
      field :cost, -> { Integer }, optional: false, nullable: false
      field :prompt_tokens, -> { Integer }, optional: false, nullable: false, api_name: "promptTokens"
      field :completion_tokens, -> { Integer }, optional: false, nullable: false, api_name: "completionTokens"
      field :cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "cachedPromptTokens"
      field :reasoning_tokens, -> { Integer }, optional: true, nullable: false, api_name: "reasoningTokens"
    end
  end
end
