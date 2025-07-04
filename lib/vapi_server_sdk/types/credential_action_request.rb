# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CredentialActionRequest
    # @return [String]
    attr_reader :action_name
    # @return [Hash{String => Object}]
    attr_reader :input
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param action_name [String]
    # @param input [Hash{String => Object}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CredentialActionRequest]
    def initialize(action_name:, input:, additional_properties: nil)
      @action_name = action_name
      @input = input
      @additional_properties = additional_properties
      @_field_set = { "action_name": action_name, "input": input }
    end

    # Deserialize a JSON object to an instance of CredentialActionRequest
    #
    # @param json_object [String]
    # @return [Vapi::CredentialActionRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      action_name = parsed_json["action_name"]
      input = parsed_json["input"]
      new(
        action_name: action_name,
        input: input,
        additional_properties: struct
      )
    end

    # Serialize an instance of CredentialActionRequest to a JSON object
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
      obj.action_name.is_a?(String) != false || raise("Passed value for field obj.action_name is not the expected type, validation failed.")
      obj.input.is_a?(Hash) != false || raise("Passed value for field obj.input is not the expected type, validation failed.")
    end
  end
end
