# frozen_string_literal: true
require_relative "google_sheets_row_append_tool_with_tool_call_messages_item"
require_relative "tool_call"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class GoogleSheetsRowAppendToolWithToolCall
  # @return [Array<Vapi::GoogleSheetsRowAppendToolWithToolCallMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    attr_reader :messages
  # @return [String] The type of tool. "google.sheets.row.append" for Google Sheets tool.
    attr_reader :type
  # @return [Vapi::ToolCall] 
    attr_reader :tool_call
  # @return [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    attr_reader :function
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::GoogleSheetsRowAppendToolWithToolCallMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    # @param type [String] The type of tool. "google.sheets.row.append" for Google Sheets tool.
    # @param tool_call [Vapi::ToolCall] 
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GoogleSheetsRowAppendToolWithToolCall]
    def initialize(messages: OMIT, type:, tool_call:, function: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @type = type
      @tool_call = tool_call
      @function = function if function != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "type": type, "toolCall": tool_call, "function": function }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  GoogleSheetsRowAppendToolWithToolCall
    #
    # @param json_object [String] 
    # @return [Vapi::GoogleSheetsRowAppendToolWithToolCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::GoogleSheetsRowAppendToolWithToolCallMessagesItem.from_json(json_object: item)
end
      type = parsed_json["type"]
      unless parsed_json["toolCall"].nil?
        tool_call = parsed_json["toolCall"].to_json
        tool_call = Vapi::ToolCall.from_json(json_object: tool_call)
      else
        tool_call = nil
      end
      unless parsed_json["function"].nil?
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      else
        function = nil
      end
      new(
        messages: messages,
        type: type,
        tool_call: tool_call,
        function: function,
        additional_properties: struct
      )
    end
# Serialize an instance of GoogleSheetsRowAppendToolWithToolCall to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vapi::ToolCall.validate_raw(obj: obj.tool_call)
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
    end
  end
end