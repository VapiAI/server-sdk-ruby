# frozen_string_literal: true

module Vapi
  module Types
    module AnalyticsOperationColumn
      extend Vapi::Internal::Types::Enum

      ID = "id"
      COST = "cost"
      COST_BREAKDOWN_LLM = "costBreakdown.llm"
      COST_BREAKDOWN_STT = "costBreakdown.stt"
      COST_BREAKDOWN_TTS = "costBreakdown.tts"
      COST_BREAKDOWN_VAPI = "costBreakdown.vapi"
      COST_BREAKDOWN_TRANSPORT = "costBreakdown.transport"
      COST_BREAKDOWN_ANALYSIS_BREAKDOWN_SUMMARY = "costBreakdown.analysisBreakdown.summary"
      COST_BREAKDOWN_TRANSCRIBER = "costBreakdown.transcriber"
      COST_BREAKDOWN_TTS_CHARACTERS = "costBreakdown.ttsCharacters"
      COST_BREAKDOWN_LLM_PROMPT_TOKENS = "costBreakdown.llmPromptTokens"
      COST_BREAKDOWN_LLM_COMPLETION_TOKENS = "costBreakdown.llmCompletionTokens"
      COST_BREAKDOWN_LLM_CACHED_PROMPT_TOKENS = "costBreakdown.llmCachedPromptTokens"
      DURATION = "duration"
      CONCURRENCY = "concurrency"
      MINUTES_USED = "minutesUsed"
    end
  end
end
