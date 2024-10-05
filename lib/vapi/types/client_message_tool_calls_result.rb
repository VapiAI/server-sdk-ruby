# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageToolCallsResult
    # @return [String] This is the type of the message. "tool-calls-result" is sent to forward the
    #  result of a tool call to the client.
    attr_reader :type
    # @return [Hash{String => Object}] This is the result of the tool call.
    attr_reader :tool_call_result
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "tool-calls-result" is sent to forward the
    #  result of a tool call to the client.
    # @param tool_call_result [Hash{String => Object}] This is the result of the tool call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageToolCallsResult]
    def initialize(type:, tool_call_result:, additional_properties: nil)
      @type = type
      @tool_call_result = tool_call_result
      @additional_properties = additional_properties
      @_field_set = { "type": type, "toolCallResult": tool_call_result }
    end

    # Deserialize a JSON object to an instance of ClientMessageToolCallsResult
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageToolCallsResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      tool_call_result = parsed_json["toolCallResult"]
      new(
        type: type,
        tool_call_result: tool_call_result,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageToolCallsResult to a JSON object
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
      obj.tool_call_result.is_a?(Hash) != false || raise("Passed value for field obj.tool_call_result is not the expected type, validation failed.")
    end
  end
end
