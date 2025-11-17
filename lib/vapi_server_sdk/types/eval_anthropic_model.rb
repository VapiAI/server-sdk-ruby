# frozen_string_literal: true

require_relative "eval_anthropic_model_model"
require_relative "anthropic_thinking_config"
require "ostruct"
require "json"

module Vapi
  class EvalAnthropicModel
    # @return [Vapi::EvalAnthropicModelModel] This is the specific model that will be used.
    attr_reader :model
    # @return [Vapi::AnthropicThinkingConfig] This is the optional configuration for Anthropic's thinking feature.
    #  - Only applicable for `claude-3-7-sonnet-20250219` model.
    #  - If provided, `maxTokens` must be greater than `thinking.budgetTokens`.
    attr_reader :thinking
    # @return [Float] This is the temperature of the model. For LLM-as-a-judge, it's recommended to
    #  set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the
    #  output correctly based on the instructions.
    attr_reader :temperature
    # @return [Float] This is the max tokens of the model.
    #  If your Judge instructions return `true` or `false` takes only 1 token (as per
    #  the OpenAI Tokenizer), and therefore is recommended to set it to a low number to
    #  force the model to return a short response.
    attr_reader :max_tokens
    # @return [Array<Hash{String => Object}>] These are the messages which will instruct the AI Judge on how to evaluate the
    #  assistant message.
    #  The LLM-Judge must respond with "pass" or "fail" to indicate if the assistant
    #  message passes the eval.
    #  To access the messages in the mock conversation, use the LiquidJS variable
    #  `{{messages}}`.
    #  The assistant message to be evaluated will be passed as the last message in the
    #  `messages` array and can be accessed using `{{messages[-1]}}`.
    #  It is recommended to use the system message to instruct the LLM how to evaluate
    #  the assistant message, and then use the first user message to pass the assistant
    #  message to be evaluated.
    attr_reader :messages
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::EvalAnthropicModelModel] This is the specific model that will be used.
    # @param thinking [Vapi::AnthropicThinkingConfig] This is the optional configuration for Anthropic's thinking feature.
    #  - Only applicable for `claude-3-7-sonnet-20250219` model.
    #  - If provided, `maxTokens` must be greater than `thinking.budgetTokens`.
    # @param temperature [Float] This is the temperature of the model. For LLM-as-a-judge, it's recommended to
    #  set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the
    #  output correctly based on the instructions.
    # @param max_tokens [Float] This is the max tokens of the model.
    #  If your Judge instructions return `true` or `false` takes only 1 token (as per
    #  the OpenAI Tokenizer), and therefore is recommended to set it to a low number to
    #  force the model to return a short response.
    # @param messages [Array<Hash{String => Object}>] These are the messages which will instruct the AI Judge on how to evaluate the
    #  assistant message.
    #  The LLM-Judge must respond with "pass" or "fail" to indicate if the assistant
    #  message passes the eval.
    #  To access the messages in the mock conversation, use the LiquidJS variable
    #  `{{messages}}`.
    #  The assistant message to be evaluated will be passed as the last message in the
    #  `messages` array and can be accessed using `{{messages[-1]}}`.
    #  It is recommended to use the system message to instruct the LLM how to evaluate
    #  the assistant message, and then use the first user message to pass the assistant
    #  message to be evaluated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::EvalAnthropicModel]
    def initialize(model:, messages:, thinking: OMIT, temperature: OMIT, max_tokens: OMIT, additional_properties: nil)
      @model = model
      @thinking = thinking if thinking != OMIT
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @messages = messages
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "thinking": thinking,
        "temperature": temperature,
        "maxTokens": max_tokens,
        "messages": messages
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EvalAnthropicModel
    #
    # @param json_object [String]
    # @return [Vapi::EvalAnthropicModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      if parsed_json["thinking"].nil?
        thinking = nil
      else
        thinking = parsed_json["thinking"].to_json
        thinking = Vapi::AnthropicThinkingConfig.from_json(json_object: thinking)
      end
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["maxTokens"]
      messages = parsed_json["messages"]
      new(
        model: model,
        thinking: thinking,
        temperature: temperature,
        max_tokens: max_tokens,
        messages: messages,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalAnthropicModel to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.model.is_a?(Vapi::EvalAnthropicModelModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.thinking.nil? || Vapi::AnthropicThinkingConfig.validate_raw(obj: obj.thinking)
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Float) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
      obj.messages.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
    end
  end
end
