# frozen_string_literal: true

require_relative "prompt_injection_security_filter_type"
require "ostruct"
require "json"

module Vapi
  class PromptInjectionSecurityFilter
    # @return [Vapi::PromptInjectionSecurityFilterType] The type of security threat to filter.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::PromptInjectionSecurityFilterType] The type of security threat to filter.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PromptInjectionSecurityFilter]
    def initialize(type:, additional_properties: nil)
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "type": type }
    end

    # Deserialize a JSON object to an instance of PromptInjectionSecurityFilter
    #
    # @param json_object [String]
    # @return [Vapi::PromptInjectionSecurityFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      new(type: type, additional_properties: struct)
    end

    # Serialize an instance of PromptInjectionSecurityFilter to a JSON object
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
      obj.type.is_a?(Vapi::PromptInjectionSecurityFilterType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
