# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AiEdgeCondition
    # @return [String] This is the prompt for the AI edge condition. It should evaluate to a boolean.
    attr_reader :prompt
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param prompt [String] This is the prompt for the AI edge condition. It should evaluate to a boolean.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AiEdgeCondition]
    def initialize(prompt:, additional_properties: nil)
      @prompt = prompt
      @additional_properties = additional_properties
      @_field_set = { "prompt": prompt }
    end

    # Deserialize a JSON object to an instance of AiEdgeCondition
    #
    # @param json_object [String]
    # @return [Vapi::AiEdgeCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      prompt = parsed_json["prompt"]
      new(prompt: prompt, additional_properties: struct)
    end

    # Serialize an instance of AiEdgeCondition to a JSON object
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
      obj.prompt.is_a?(String) != false || raise("Passed value for field obj.prompt is not the expected type, validation failed.")
    end
  end
end
