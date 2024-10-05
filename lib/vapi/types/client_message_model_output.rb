# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageModelOutput
    # @return [String] This is the type of the message. "model-output" is sent as the model outputs
    #  tokens.
    attr_reader :type
    # @return [Hash{String => Object}] This is the output of the model. It can be a token or tool call.
    attr_reader :output
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "model-output" is sent as the model outputs
    #  tokens.
    # @param output [Hash{String => Object}] This is the output of the model. It can be a token or tool call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageModelOutput]
    def initialize(type:, output:, additional_properties: nil)
      @type = type
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "type": type, "output": output }
    end

    # Deserialize a JSON object to an instance of ClientMessageModelOutput
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageModelOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      output = parsed_json["output"]
      new(
        type: type,
        output: output,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageModelOutput to a JSON object
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
      obj.output.is_a?(Hash) != false || raise("Passed value for field obj.output is not the expected type, validation failed.")
    end
  end
end
