# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Hangup
    # @return [String]
    attr_reader :name
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String]
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Hangup]
    def initialize(name:, metadata: OMIT, additional_properties: nil)
      @name = name
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Hangup
    #
    # @param json_object [String]
    # @return [Vapi::Hangup]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      metadata = parsed_json["metadata"]
      new(
        name: name,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of Hangup to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
