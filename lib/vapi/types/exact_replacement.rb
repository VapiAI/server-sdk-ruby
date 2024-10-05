# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ExactReplacement
    # @return [String] This is the exact replacement type. You can use this to replace a specific word
    #  or phrase with a different word or phrase.
    #  Usage:
    #  - Replace "hello" with "hi": { type: 'exact', key: 'hello', value: 'hi' }
    #  - Replace "good morning" with "good day": { type: 'exact', key: 'good morning',
    #  value: 'good day' }
    #  - Replace a specific name: { type: 'exact', key: 'John Doe', value: 'Jane Smith'
    #  }
    #  - Replace an acronym: { type: 'exact', key: 'AI', value: 'Artificial
    #  Intelligence' }
    #  - Replace a company name with its phonetic pronunciation: { type: 'exact', key:
    #  'Vapi', value: 'Vappy' }
    attr_reader :type
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

    # @param type [String] This is the exact replacement type. You can use this to replace a specific word
    #  or phrase with a different word or phrase.
    #  Usage:
    #  - Replace "hello" with "hi": { type: 'exact', key: 'hello', value: 'hi' }
    #  - Replace "good morning" with "good day": { type: 'exact', key: 'good morning',
    #  value: 'good day' }
    #  - Replace a specific name: { type: 'exact', key: 'John Doe', value: 'Jane Smith'
    #  }
    #  - Replace an acronym: { type: 'exact', key: 'AI', value: 'Artificial
    #  Intelligence' }
    #  - Replace a company name with its phonetic pronunciation: { type: 'exact', key:
    #  'Vapi', value: 'Vappy' }
    # @param key [String] This is the key to replace.
    # @param value [String] This is the value that will replace the match.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ExactReplacement]
    def initialize(type:, key:, value:, additional_properties: nil)
      @type = type
      @key = key
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "type": type, "key": key, "value": value }
    end

    # Deserialize a JSON object to an instance of ExactReplacement
    #
    # @param json_object [String]
    # @return [Vapi::ExactReplacement]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      key = parsed_json["key"]
      value = parsed_json["value"]
      new(
        type: type,
        key: key,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of ExactReplacement to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
