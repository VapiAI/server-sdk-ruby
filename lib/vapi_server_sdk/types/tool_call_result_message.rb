# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ToolCallResultMessage
    # @return [String] The role of the tool call result in the conversation.
    attr_reader :role
    # @return [String] The ID of the tool call.
    attr_reader :tool_call_id
    # @return [String] The name of the tool that returned the result.
    attr_reader :name
    # @return [String] The result of the tool call in JSON format.
    attr_reader :result
    # @return [Float] The timestamp when the message was sent.
    attr_reader :time
    # @return [Float] The number of seconds from the start of the conversation.
    attr_reader :seconds_from_start
    # @return [Hash{String => Object}] The metadata for the tool call result.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [String] The role of the tool call result in the conversation.
    # @param tool_call_id [String] The ID of the tool call.
    # @param name [String] The name of the tool that returned the result.
    # @param result [String] The result of the tool call in JSON format.
    # @param time [Float] The timestamp when the message was sent.
    # @param seconds_from_start [Float] The number of seconds from the start of the conversation.
    # @param metadata [Hash{String => Object}] The metadata for the tool call result.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCallResultMessage]
    def initialize(role:, tool_call_id:, name:, result:, time:, seconds_from_start:, metadata: OMIT,
                   additional_properties: nil)
      @role = role
      @tool_call_id = tool_call_id
      @name = name
      @result = result
      @time = time
      @seconds_from_start = seconds_from_start
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "role": role,
        "toolCallId": tool_call_id,
        "name": name,
        "result": result,
        "time": time,
        "secondsFromStart": seconds_from_start,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolCallResultMessage
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallResultMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      tool_call_id = parsed_json["toolCallId"]
      name = parsed_json["name"]
      result = parsed_json["result"]
      time = parsed_json["time"]
      seconds_from_start = parsed_json["secondsFromStart"]
      metadata = parsed_json["metadata"]
      new(
        role: role,
        tool_call_id: tool_call_id,
        name: name,
        result: result,
        time: time,
        seconds_from_start: seconds_from_start,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolCallResultMessage to a JSON object
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
      obj.tool_call_id.is_a?(String) != false || raise("Passed value for field obj.tool_call_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.result.is_a?(String) != false || raise("Passed value for field obj.result is not the expected type, validation failed.")
      obj.time.is_a?(Float) != false || raise("Passed value for field obj.time is not the expected type, validation failed.")
      obj.seconds_from_start.is_a?(Float) != false || raise("Passed value for field obj.seconds_from_start is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
