# frozen_string_literal: true

require_relative "anthropic_thinking_config_type"
require "ostruct"
require "json"

module Vapi
  class AnthropicThinkingConfig
    # @return [Vapi::AnthropicThinkingConfigType]
    attr_reader :type
    # @return [Float] The maximum number of tokens to allocate for thinking.
    #  Must be between 1024 and 100000 tokens.
    attr_reader :budget_tokens
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::AnthropicThinkingConfigType]
    # @param budget_tokens [Float] The maximum number of tokens to allocate for thinking.
    #  Must be between 1024 and 100000 tokens.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnthropicThinkingConfig]
    def initialize(type:, budget_tokens:, additional_properties: nil)
      @type = type
      @budget_tokens = budget_tokens
      @additional_properties = additional_properties
      @_field_set = { "type": type, "budgetTokens": budget_tokens }
    end

    # Deserialize a JSON object to an instance of AnthropicThinkingConfig
    #
    # @param json_object [String]
    # @return [Vapi::AnthropicThinkingConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      budget_tokens = parsed_json["budgetTokens"]
      new(
        type: type,
        budget_tokens: budget_tokens,
        additional_properties: struct
      )
    end

    # Serialize an instance of AnthropicThinkingConfig to a JSON object
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
      obj.type.is_a?(Vapi::AnthropicThinkingConfigType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.budget_tokens.is_a?(Float) != false || raise("Passed value for field obj.budget_tokens is not the expected type, validation failed.")
    end
  end
end
