# frozen_string_literal: true

module Vapi
  module Types
    # This is the model that will be used to extract the structured output.
    #
    # To provide your own custom system and user prompts for structured output extraction, populate the messages array
    # with your system and user messages. You can specify liquid templating in your system and user messages.
    # Between the system or user messages, you must reference either 'transcript' or 'messages' with the `{{}}` syntax
    # to access the conversation history.
    # Between the system or user messages, you must reference a variation of the structured output with the `{{}}`
    # syntax to access the structured output definition.
    # i.e.:
    # `{{structuredOutput}}`
    # `{{structuredOutput.name}}`
    # `{{structuredOutput.description}}`
    # `{{structuredOutput.schema}}`
    #
    # If model is not specified, GPT-4.1 will be used by default for extraction, utilizing default system and user
    # prompts.
    # If messages or required fields are not specified, the default system and user prompts will be used.
    class CreateStructuredOutputDtoModel < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::WorkflowOpenAiModel }, key: "OPENAI"
      member -> { Vapi::Types::WorkflowAnthropicModel }, key: "ANTHROPIC"
      member -> { Vapi::Types::WorkflowAnthropicBedrockModel }, key: "ANTHROPIC_BEDROCK"
      member -> { Vapi::Types::WorkflowGoogleModel }, key: "GOOGLE"
      member -> { Vapi::Types::WorkflowCustomModel }, key: "CUSTOM_LLM"
    end
  end
end
