# frozen_string_literal: true

require_relative "ghl_tool_with_tool_call_messages_item"
require_relative "tool_call"
require_relative "ghl_tool_metadata"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class GhlToolWithToolCall
    # @return [Array<Vapi::GhlToolWithToolCallMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    attr_reader :messages
    # @return [Vapi::ToolCall]
    attr_reader :tool_call
    # @return [Vapi::GhlToolMetadata]
    attr_reader :metadata
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

    # @param messages [Array<Vapi::GhlToolWithToolCallMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    # @param tool_call [Vapi::ToolCall]
    # @param metadata [Vapi::GhlToolMetadata]
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
    # @return [Vapi::GhlToolWithToolCall]
    def initialize(tool_call:, metadata:, messages: OMIT, function: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @tool_call = tool_call
      @metadata = metadata
      @function = function if function != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "toolCall": tool_call,
        "metadata": metadata,
        "function": function
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GhlToolWithToolCall
    #
    # @param json_object [String]
    # @return [Vapi::GhlToolWithToolCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::GhlToolWithToolCallMessagesItem.from_json(json_object: item)
      end
      if parsed_json["toolCall"].nil?
        tool_call = nil
      else
        tool_call = parsed_json["toolCall"].to_json
        tool_call = Vapi::ToolCall.from_json(json_object: tool_call)
      end
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::GhlToolMetadata.from_json(json_object: metadata)
      end
      if parsed_json["function"].nil?
        function = nil
      else
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      end
      new(
        messages: messages,
        tool_call: tool_call,
        metadata: metadata,
        function: function,
        additional_properties: struct
      )
    end

    # Serialize an instance of GhlToolWithToolCall to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      Vapi::ToolCall.validate_raw(obj: obj.tool_call)
      Vapi::GhlToolMetadata.validate_raw(obj: obj.metadata)
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
    end
  end
end
