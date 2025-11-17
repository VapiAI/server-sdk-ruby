# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class VariableValueGroupBy
    # @return [String] This is the key of the variable value to group by.
    attr_reader :key
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] This is the key of the variable value to group by.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VariableValueGroupBy]
    def initialize(key:, additional_properties: nil)
      @key = key
      @additional_properties = additional_properties
      @_field_set = { "key": key }
    end

    # Deserialize a JSON object to an instance of VariableValueGroupBy
    #
    # @param json_object [String]
    # @return [Vapi::VariableValueGroupBy]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      new(key: key, additional_properties: struct)
    end

    # Serialize an instance of VariableValueGroupBy to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
    end
  end
end
