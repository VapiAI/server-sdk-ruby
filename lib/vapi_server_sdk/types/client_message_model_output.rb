# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageModelOutput
    # @return [Hash{String => Object}] This is the output of the model. It can be a token or tool call.
    attr_reader :output
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Hash{String => Object}] This is the output of the model. It can be a token or tool call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageModelOutput]
    def initialize(output:, additional_properties: nil)
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "output": output }
    end

    # Deserialize a JSON object to an instance of ClientMessageModelOutput
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageModelOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      output = parsed_json["output"]
      new(output: output, additional_properties: struct)
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
      obj.output.is_a?(Hash) != false || raise("Passed value for field obj.output is not the expected type, validation failed.")
    end
  end
end
