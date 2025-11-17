# frozen_string_literal: true

require_relative "phone_number_call_ending_hook_filter_type"
require_relative "phone_number_call_ending_hook_filter_key"
require_relative "phone_number_call_ending_hook_filter_one_of_item"
require "ostruct"
require "json"

module Vapi
  class PhoneNumberCallEndingHookFilter
    # @return [Vapi::PhoneNumberCallEndingHookFilterType] This is the type of filter - currently only "oneOf" is supported
    attr_reader :type
    # @return [Vapi::PhoneNumberCallEndingHookFilterKey] This is the key to filter on - only "call.endedReason" is allowed for phone
    #  number call ending hooks
    attr_reader :key
    # @return [Array<Vapi::PhoneNumberCallEndingHookFilterOneOfItem>] This is the array of assistant-request related ended reasons to match against
    attr_reader :one_of
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::PhoneNumberCallEndingHookFilterType] This is the type of filter - currently only "oneOf" is supported
    # @param key [Vapi::PhoneNumberCallEndingHookFilterKey] This is the key to filter on - only "call.endedReason" is allowed for phone
    #  number call ending hooks
    # @param one_of [Array<Vapi::PhoneNumberCallEndingHookFilterOneOfItem>] This is the array of assistant-request related ended reasons to match against
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PhoneNumberCallEndingHookFilter]
    def initialize(type:, key:, one_of:, additional_properties: nil)
      @type = type
      @key = key
      @one_of = one_of
      @additional_properties = additional_properties
      @_field_set = { "type": type, "key": key, "oneOf": one_of }
    end

    # Deserialize a JSON object to an instance of PhoneNumberCallEndingHookFilter
    #
    # @param json_object [String]
    # @return [Vapi::PhoneNumberCallEndingHookFilter]
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

    # Serialize an instance of PhoneNumberCallEndingHookFilter to a JSON object
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
      obj.type.is_a?(Vapi::PhoneNumberCallEndingHookFilterType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.key.is_a?(Vapi::PhoneNumberCallEndingHookFilterKey) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.one_of.is_a?(Array) != false || raise("Passed value for field obj.one_of is not the expected type, validation failed.")
    end
  end
end
