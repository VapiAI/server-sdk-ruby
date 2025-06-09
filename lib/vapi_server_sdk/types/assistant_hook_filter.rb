# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class AssistantHookFilter
  # @return [String] This is the type of filter - currently only "oneOf" is supported
    attr_reader :type
  # @return [String] This is the key to filter on (e.g. "call.endedReason")
    attr_reader :key
  # @return [Array<String>] This is the array of possible values to match against
    attr_reader :one_of
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of filter - currently only "oneOf" is supported
    # @param key [String] This is the key to filter on (e.g. "call.endedReason")
    # @param one_of [Array<String>] This is the array of possible values to match against
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantHookFilter]
    def initialize(type:, key:, one_of:, additional_properties: nil)
      @type = type
      @key = key
      @one_of = one_of
      @additional_properties = additional_properties
      @_field_set = { "type": type, "key": key, "oneOf": one_of }
    end
# Deserialize a JSON object to an instance of AssistantHookFilter
    #
    # @param json_object [String] 
    # @return [Vapi::AssistantHookFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      key = parsed_json["key"]
      one_of = parsed_json["oneOf"]
      new(
        type: type,
        key: key,
        one_of: one_of,
        additional_properties: struct
      )
    end
# Serialize an instance of AssistantHookFilter to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.one_of.is_a?(Array) != false || raise("Passed value for field obj.one_of is not the expected type, validation failed.")
    end
  end
end