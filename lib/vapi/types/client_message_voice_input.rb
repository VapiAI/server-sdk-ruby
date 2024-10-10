# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageVoiceInput
    # @return [String] This is the voice input content
    attr_reader :input
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param input [String] This is the voice input content
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageVoiceInput]
    def initialize(input:, additional_properties: nil)
      @input = input
      @additional_properties = additional_properties
      @_field_set = { "input": input }
    end

    # Deserialize a JSON object to an instance of ClientMessageVoiceInput
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageVoiceInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      input = parsed_json["input"]
      new(input: input, additional_properties: struct)
    end

    # Serialize an instance of ClientMessageVoiceInput to a JSON object
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
      obj.input.is_a?(String) != false || raise("Passed value for field obj.input is not the expected type, validation failed.")
    end
  end
end
