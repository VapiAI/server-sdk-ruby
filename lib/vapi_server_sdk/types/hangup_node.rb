# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class HangupNode
    # @return [String]
    attr_reader :type
    # @return [String]
    attr_reader :name
    # @return [Boolean] This is whether or not the node is the start of the workflow.
    attr_reader :is_start
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param name [String]
    # @param is_start [Boolean] This is whether or not the node is the start of the workflow.
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::HangupNode]
    def initialize(type:, name:, is_start: OMIT, metadata: OMIT, additional_properties: nil)
      @type = type
      @name = name
      @is_start = is_start if is_start != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "name": name, "isStart": is_start, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of HangupNode
    #
    # @param json_object [String]
    # @return [Vapi::HangupNode]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      name = parsed_json["name"]
      is_start = parsed_json["isStart"]
      metadata = parsed_json["metadata"]
      new(
        type: type,
        name: name,
        is_start: is_start,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of HangupNode to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.is_start&.is_a?(Boolean) != false || raise("Passed value for field obj.is_start is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
