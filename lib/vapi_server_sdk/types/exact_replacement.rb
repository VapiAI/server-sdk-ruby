# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ExactReplacement
  # @return [Boolean] This option let's you control whether to replace all instances of the key or
#  only the first one. By default, it only replaces the first instance.
#  Examples:
#  - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: false }.
#  Before: "hello world, hello universe" | After: "hi world, hello universe"
#  - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: true }.
#  Before: "hello world, hello universe" | After: "hi world, hi universe"
#  @default false
    attr_reader :replace_all_enabled
  # @return [String] This is the key to replace.
    attr_reader :key
  # @return [String] This is the value that will replace the match.
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param replace_all_enabled [Boolean] This option let's you control whether to replace all instances of the key or
#  only the first one. By default, it only replaces the first instance.
#  Examples:
#  - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: false }.
#  Before: "hello world, hello universe" | After: "hi world, hello universe"
#  - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: true }.
#  Before: "hello world, hello universe" | After: "hi world, hi universe"
#  @default false
    # @param key [String] This is the key to replace.
    # @param value [String] This is the value that will replace the match.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ExactReplacement]
    def initialize(replace_all_enabled: OMIT, key:, value:, additional_properties: nil)
      @replace_all_enabled = replace_all_enabled if replace_all_enabled != OMIT
      @key = key
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "replaceAllEnabled": replace_all_enabled, "key": key, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExactReplacement
    #
    # @param json_object [String] 
    # @return [Vapi::ExactReplacement]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      replace_all_enabled = parsed_json["replaceAllEnabled"]
      key = parsed_json["key"]
      value = parsed_json["value"]
      new(
        replace_all_enabled: replace_all_enabled,
        key: key,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of ExactReplacement to a JSON object
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
      obj.replace_all_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.replace_all_enabled is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end