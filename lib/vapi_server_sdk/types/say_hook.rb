# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SayHook
    # @return [String]
    attr_reader :type
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [String]
    attr_reader :exact
    # @return [String]
    attr_reader :prompt
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param exact [String]
    # @param prompt [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SayHook]
    def initialize(type:, metadata: OMIT, exact: OMIT, prompt: OMIT, additional_properties: nil)
      @type = type
      @metadata = metadata if metadata != OMIT
      @exact = exact if exact != OMIT
      @prompt = prompt if prompt != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "metadata": metadata, "exact": exact, "prompt": prompt }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SayHook
    #
    # @param json_object [String]
    # @return [Vapi::SayHook]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      metadata = parsed_json["metadata"]
      exact = parsed_json["exact"]
      prompt = parsed_json["prompt"]
      new(
        type: type,
        metadata: metadata,
        exact: exact,
        prompt: prompt,
        additional_properties: struct
      )
    end

    # Serialize an instance of SayHook to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.exact&.is_a?(String) != false || raise("Passed value for field obj.exact is not the expected type, validation failed.")
      obj.prompt&.is_a?(String) != false || raise("Passed value for field obj.prompt is not the expected type, validation failed.")
    end
  end
end
