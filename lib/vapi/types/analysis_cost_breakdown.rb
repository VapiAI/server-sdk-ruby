# frozen_string_literal: true

module Vapi
  module Types
    class AnalysisCostBreakdown < Internal::Types::Model
      field :summary, -> { Integer }, optional: true, nullable: false
      field :summary_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "summaryPromptTokens"
      field :summary_completion_tokens, -> { Integer }, optional: true, nullable: false, api_name: "summaryCompletionTokens"
      field :summary_cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "summaryCachedPromptTokens"
      field :structured_data, -> { Integer }, optional: true, nullable: false, api_name: "structuredData"
      field :structured_data_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "structuredDataPromptTokens"
      field :structured_data_completion_tokens, -> { Integer }, optional: true, nullable: false, api_name: "structuredDataCompletionTokens"
      field :structured_data_cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "structuredDataCachedPromptTokens"
      field :success_evaluation, -> { Integer }, optional: true, nullable: false, api_name: "successEvaluation"
      field :success_evaluation_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "successEvaluationPromptTokens"
      field :success_evaluation_completion_tokens, -> { Integer }, optional: true, nullable: false, api_name: "successEvaluationCompletionTokens"
      field :success_evaluation_cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "successEvaluationCachedPromptTokens"
      field :structured_output, -> { Integer }, optional: true, nullable: false, api_name: "structuredOutput"
      field :structured_output_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "structuredOutputPromptTokens"
      field :structured_output_completion_tokens, -> { Integer }, optional: true, nullable: false, api_name: "structuredOutputCompletionTokens"
      field :structured_output_cached_prompt_tokens, -> { Integer }, optional: true, nullable: false, api_name: "structuredOutputCachedPromptTokens"
    end
  end
end
