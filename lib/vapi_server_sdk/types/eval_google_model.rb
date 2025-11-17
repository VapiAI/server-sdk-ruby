# frozen_string_literal: true

require_relative "eval_google_model_model"
require "ostruct"
require "json"

module Vapi
  class EvalGoogleModel
    # @return [Vapi::EvalGoogleModelModel] This is the name of the model. Ex. gpt-4o
    attr_reader :model
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

    # @param model [Vapi::EvalGoogleModelModel] This is the name of the model. Ex. gpt-4o
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
    # @return [Vapi::EvalGoogleModel]
    def initialize(model:, messages:, temperature: OMIT, max_tokens: OMIT, additional_properties: nil)
      @model = model
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @messages = messages
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "temperature": temperature,
        "maxTokens": max_tokens,
        "messages": messages
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EvalGoogleModel
    #
    # @param json_object [String]
    # @return [Vapi::EvalGoogleModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["maxTokens"]
      messages = parsed_json["messages"]
      new(
        model: model,
        temperature: temperature,
        max_tokens: max_tokens,
        messages: messages,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalGoogleModel to a JSON object
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
      obj.model.is_a?(Vapi::EvalGoogleModelModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Float) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
      obj.messages.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
    end
  end
end
