# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ToolCallMessage
    # @return [String] The role of the tool call in the conversation.
    attr_reader :role
    # @return [Array<Hash{String => Object}>] The list of tool calls made during the conversation.
    attr_reader :tool_calls
    # @return [String] The message content for the tool call.
    attr_reader :message
    # @return [Float] The timestamp when the message was sent.
    attr_reader :time
    # @return [Float] The number of seconds from the start of the conversation.
    attr_reader :seconds_from_start
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [String] The role of the tool call in the conversation.
    # @param tool_calls [Array<Hash{String => Object}>] The list of tool calls made during the conversation.
    # @param message [String] The message content for the tool call.
    # @param time [Float] The timestamp when the message was sent.
    # @param seconds_from_start [Float] The number of seconds from the start of the conversation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCallMessage]
    def initialize(role:, tool_calls:, message:, time:, seconds_from_start:, additional_properties: nil)
      @role = role
      @tool_calls = tool_calls
      @message = message
      @time = time
      @seconds_from_start = seconds_from_start
      @additional_properties = additional_properties
      @_field_set = {
        "role": role,
        "toolCalls": tool_calls,
        "message": message,
        "time": time,
        "secondsFromStart": seconds_from_start
      }
    end

    # Deserialize a JSON object to an instance of ToolCallMessage
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      tool_calls = parsed_json["toolCalls"]
      message = parsed_json["message"]
      time = parsed_json["time"]
      seconds_from_start = parsed_json["secondsFromStart"]
      new(
        role: role,
        tool_calls: tool_calls,
        message: message,
        time: time,
        seconds_from_start: seconds_from_start,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolCallMessage to a JSON object
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
      obj.role.is_a?(String) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.tool_calls.is_a?(Array) != false || raise("Passed value for field obj.tool_calls is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.time.is_a?(Float) != false || raise("Passed value for field obj.time is not the expected type, validation failed.")
      obj.seconds_from_start.is_a?(Float) != false || raise("Passed value for field obj.seconds_from_start is not the expected type, validation failed.")
    end
  end
end
