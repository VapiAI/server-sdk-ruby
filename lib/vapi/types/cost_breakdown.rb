# frozen_string_literal: true

module Vapi
  module Types
    class CostBreakdown < Internal::Types::Model
      field :transport, -> { Integer }, optional: true, nullable: false
      field :stt, -> { Integer }, optional: true, nullable: false
      field :llm, -> { Integer }, optional: true, nullable: false
      field :tts, -> { Integer }, optional: true, nullable: false
      field :vapi, -> { Integer }, optional: true, nullable: false
      field :chat, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :llm_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "llmPromptTokens"
      field :llm_completion_tokens, -> { Integer }, optional: true, nullable: false, api_name: "llmCompletionTokens"
      field :llm_cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "llmCachedPromptTokens"
      field :tts_characters, -> { Integer }, optional: true, nullable: false, api_name: "ttsCharacters"
      field :analysis_cost_breakdown, -> { Vapi::Types::AnalysisCostBreakdown }, optional: true, nullable: false, api_name: "analysisCostBreakdown"
    end
  end
end
