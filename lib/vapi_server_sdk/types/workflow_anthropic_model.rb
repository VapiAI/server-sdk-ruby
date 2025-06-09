# frozen_string_literal: true
require_relative "workflow_anthropic_model_model"
require_relative "anthropic_thinking_config"
require "ostruct"
require "json"

module Vapi
  class WorkflowAnthropicModel
  # @return [Vapi::WorkflowAnthropicModelModel] This is the specific model that will be used.
    attr_reader :model
  # @return [Vapi::AnthropicThinkingConfig] This is the optional configuration for Anthropic's thinking feature.
#  - Only applicable for `claude-3-7-sonnet-20250219` model.
#  - If provided, `maxTokens` must be greater than `thinking.budgetTokens`.
    attr_reader :thinking
  # @return [Float] This is the temperature of the model.
    attr_reader :temperature
  # @return [Float] This is the max tokens of the model.
    attr_reader :max_tokens
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::WorkflowAnthropicModelModel] This is the specific model that will be used.
    # @param thinking [Vapi::AnthropicThinkingConfig] This is the optional configuration for Anthropic's thinking feature.
#  - Only applicable for `claude-3-7-sonnet-20250219` model.
#  - If provided, `maxTokens` must be greater than `thinking.budgetTokens`.
    # @param temperature [Float] This is the temperature of the model.
    # @param max_tokens [Float] This is the max tokens of the model.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WorkflowAnthropicModel]
    def initialize(model:, thinking: OMIT, temperature: OMIT, max_tokens: OMIT, additional_properties: nil)
      @model = model
      @thinking = thinking if thinking != OMIT
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model": model, "thinking": thinking, "temperature": temperature, "maxTokens": max_tokens }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowAnthropicModel
    #
    # @param json_object [String] 
    # @return [Vapi::WorkflowAnthropicModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      unless parsed_json["thinking"].nil?
        thinking = parsed_json["thinking"].to_json
        thinking = Vapi::AnthropicThinkingConfig.from_json(json_object: thinking)
      else
        thinking = nil
      end
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["maxTokens"]
      new(
        model: model,
        thinking: thinking,
        temperature: temperature,
        max_tokens: max_tokens,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowAnthropicModel to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.model.is_a?(Vapi::WorkflowAnthropicModelModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.thinking.nil? || Vapi::AnthropicThinkingConfig.validate_raw(obj: obj.thinking)
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Float) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
    end
  end
end