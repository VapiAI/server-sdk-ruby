# frozen_string_literal: true

require_relative "tool_call_result_message_item"
require "ostruct"
require "json"

module Vapi
  class ToolCallResult
    # @return [Array<Vapi::ToolCallResultMessageItem>] This is the message that will be spoken to the user.
    #  If this is not returned, assistant will speak:
    #  1. a `request-complete` or `request-failed` message from `tool.messages`, if it
    #  exists
    #  2. a response generated by the model, if not
    attr_reader :message
    # @return [String] This is the name of the function the model called.
    attr_reader :name
    # @return [String] This is the unique identifier for the tool call.
    attr_reader :tool_call_id
    # @return [String] This is the result if the tool call was successful. This is added to the
    #  conversation history.
    #  Further, if this is returned, assistant will speak:
    #  1. the `message`, if it exists and is of type `request-complete`
    #  2. a `request-complete` message from `tool.messages`, if it exists
    #  3. a response generated by the model, if neither exist
    attr_reader :result
    # @return [String] This is the error if the tool call was not successful. This is added to the
    #  conversation history.
    #  Further, if this is returned, assistant will speak:
    #  1. the `message`, if it exists and is of type `request-failed`
    #  2. a `request-failed` message from `tool.messages`, if it exists
    #  3. a response generated by the model, if neither exist
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Array<Vapi::ToolCallResultMessageItem>] This is the message that will be spoken to the user.
    #  If this is not returned, assistant will speak:
    #  1. a `request-complete` or `request-failed` message from `tool.messages`, if it
    #  exists
    #  2. a response generated by the model, if not
    # @param name [String] This is the name of the function the model called.
    # @param tool_call_id [String] This is the unique identifier for the tool call.
    # @param result [String] This is the result if the tool call was successful. This is added to the
    #  conversation history.
    #  Further, if this is returned, assistant will speak:
    #  1. the `message`, if it exists and is of type `request-complete`
    #  2. a `request-complete` message from `tool.messages`, if it exists
    #  3. a response generated by the model, if neither exist
    # @param error [String] This is the error if the tool call was not successful. This is added to the
    #  conversation history.
    #  Further, if this is returned, assistant will speak:
    #  1. the `message`, if it exists and is of type `request-failed`
    #  2. a `request-failed` message from `tool.messages`, if it exists
    #  3. a response generated by the model, if neither exist
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCallResult]
    def initialize(name:, tool_call_id:, message: OMIT, result: OMIT, error: OMIT, additional_properties: nil)
      @message = message if message != OMIT
      @name = name
      @tool_call_id = tool_call_id
      @result = result if result != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "message": message,
        "name": name,
        "toolCallId": tool_call_id,
        "result": result,
        "error": error
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolCallResult
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]&.map do |item|
        item = item.to_json
        Vapi::ToolCallResultMessageItem.from_json(json_object: item)
      end
      name = parsed_json["name"]
      tool_call_id = parsed_json["toolCallId"]
      result = parsed_json["result"]
      error = parsed_json["error"]
      new(
        message: message,
        name: name,
        tool_call_id: tool_call_id,
        result: result,
        error: error,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolCallResult to a JSON object
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
      obj.message&.is_a?(Array) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tool_call_id.is_a?(String) != false || raise("Passed value for field obj.tool_call_id is not the expected type, validation failed.")
      obj.result&.is_a?(String) != false || raise("Passed value for field obj.result is not the expected type, validation failed.")
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end