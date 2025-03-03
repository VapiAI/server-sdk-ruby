# frozen_string_literal: true

module Vapi
  # This is the columns you want to perform the aggregation operation on.
  class AnalyticsOperationColumn
    ID = "id"
    COST = "cost"
    COST_BREAKDOWN_LLM = "costBreakdown.llm"
    COST_BREAKDOWN_STT = "costBreakdown.stt"
    COST_BREAKDOWN_TTS = "costBreakdown.tts"
    COST_BREAKDOWN_VAPI = "costBreakdown.vapi"
    COST_BREAKDOWN_TTS_CHARACTERS = "costBreakdown.ttsCharacters"
    COST_BREAKDOWN_LLM_PROMPT_TOKENS = "costBreakdown.llmPromptTokens"
    COST_BREAKDOWN_LLM_COMPLETION_TOKENS = "costBreakdown.llmCompletionTokens"
    DURATION = "duration"
    CONCURRENCY = "concurrency"
  end
end
