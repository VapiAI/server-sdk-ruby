# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ChatAssistantOverrides
    # @return [Hash{String => Object}] Variable values for template substitution
    attr_reader :variable_values
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param variable_values [Hash{String => Object}] Variable values for template substitution
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatAssistantOverrides]
    def initialize(variable_values: OMIT, additional_properties: nil)
      @variable_values = variable_values if variable_values != OMIT
      @additional_properties = additional_properties
      @_field_set = { "variableValues": variable_values }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatAssistantOverrides
    #
    # @param json_object [String]
    # @return [Vapi::ChatAssistantOverrides]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      variable_values = parsed_json["variableValues"]
      new(variable_values: variable_values, additional_properties: struct)
    end

    # Serialize an instance of ChatAssistantOverrides to a JSON object
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
      obj.variable_values&.is_a?(Hash) != false || raise("Passed value for field obj.variable_values is not the expected type, validation failed.")
    end
  end
end
