# frozen_string_literal: true

module Vapi
  module Types
    # Cost for an individual analysis request, including analysis type, model, token usage, and amount.
    class AnalysisCost < Internal::Types::Model
      field :analysis_type, -> { Vapi::Types::AnalysisCostAnalysisType }, optional: false, nullable: false, api_name: "analysisType"
      field :model, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :prompt_tokens, -> { Integer }, optional: false, nullable: false, api_name: "promptTokens"
      field :completion_tokens, -> { Integer }, optional: false, nullable: false, api_name: "completionTokens"
      field :cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "cachedPromptTokens"
      field :structured_output_breakdown, -> { Internal::Types::Array[Vapi::Types::StructuredOutputCostBreakdown] }, optional: true, nullable: false, api_name: "structuredOutputBreakdown"
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
