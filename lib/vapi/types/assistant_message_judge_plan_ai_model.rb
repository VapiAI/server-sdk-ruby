# frozen_string_literal: true

module Vapi
  module Types
    # This is the model to use for the LLM-as-a-judge.
    # If not provided, will default to the assistant's model.
    #
    # The instructions on how to evaluate the model output with this LLM-Judge must be passed as a system message in the
    # messages array of the model.
    #
    # The Mock conversation can be passed to the LLM-Judge to evaluate using the prompt {{messages}} and will be
    # evaluated as a LiquidJS Variable. To access and judge only the last message, use {{messages[-1]}}
    #
    # The LLM-Judge must respond with "pass" or "fail" and only those two responses are allowed.
    class AssistantMessageJudgePlanAiModel < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::EvalOpenAiModel }, key: "OPENAI"
      member -> { Vapi::Types::EvalAnthropicModel }, key: "ANTHROPIC"
      member -> { Vapi::Types::EvalGoogleModel }, key: "GOOGLE"
      member -> { Vapi::Types::EvalCustomModel }, key: "CUSTOM_LLM"
    end
  end
end
