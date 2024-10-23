# frozen_string_literal: true

require_relative "client_message_tool_calls_tool_with_tool_call_list_item"
require_relative "tool_call"
require "ostruct"
require "json"

module Vapi
  class ClientMessageToolCalls
    # @return [Array<Vapi::ClientMessageToolCallsToolWithToolCallListItem>] This is the list of tools calls that the model is requesting along with the
    #  original tool configuration.
    attr_reader :tool_with_tool_call_list
    # @return [Array<Vapi::ToolCall>] This is the list of tool calls that the model is requesting.
    attr_reader :tool_call_list
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param tool_with_tool_call_list [Array<Vapi::ClientMessageToolCallsToolWithToolCallListItem>] This is the list of tools calls that the model is requesting along with the
    #  original tool configuration.
    # @param tool_call_list [Array<Vapi::ToolCall>] This is the list of tool calls that the model is requesting.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageToolCalls]
    def initialize(tool_with_tool_call_list:, tool_call_list:, additional_properties: nil)
      @tool_with_tool_call_list = tool_with_tool_call_list
      @tool_call_list = tool_call_list
      @additional_properties = additional_properties
      @_field_set = { "toolWithToolCallList": tool_with_tool_call_list, "toolCallList": tool_call_list }
    end

    # Deserialize a JSON object to an instance of ClientMessageToolCalls
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageToolCalls]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      tool_with_tool_call_list = parsed_json["toolWithToolCallList"]&.map do |item|
        item = item.to_json
        Vapi::ClientMessageToolCallsToolWithToolCallListItem.from_json(json_object: item)
      end
      tool_call_list = parsed_json["toolCallList"]&.map do |item|
        item = item.to_json
        Vapi::ToolCall.from_json(json_object: item)
      end
      new(
        tool_with_tool_call_list: tool_with_tool_call_list,
        tool_call_list: tool_call_list,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageToolCalls to a JSON object
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
      obj.tool_with_tool_call_list.is_a?(Array) != false || raise("Passed value for field obj.tool_with_tool_call_list is not the expected type, validation failed.")
      obj.tool_call_list.is_a?(Array) != false || raise("Passed value for field obj.tool_call_list is not the expected type, validation failed.")
    end
  end
end
