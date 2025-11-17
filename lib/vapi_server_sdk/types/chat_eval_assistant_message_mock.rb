# frozen_string_literal: true

require_relative "chat_eval_assistant_message_mock_role"
require_relative "chat_eval_assistant_message_mock_tool_call"
require "ostruct"
require "json"

module Vapi
  class ChatEvalAssistantMessageMock
    # @return [Vapi::ChatEvalAssistantMessageMockRole] This is the role of the message author.
    #  For a mock assistant message, the role is always 'assistant'
    #  @default 'assistant'
    attr_reader :role
    # @return [String] This is the content of the assistant message.
    #  This is the message that the assistant would have sent.
    attr_reader :content
    # @return [Array<Vapi::ChatEvalAssistantMessageMockToolCall>] This is the tool calls that will be made by the assistant.
    attr_reader :tool_calls
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::ChatEvalAssistantMessageMockRole] This is the role of the message author.
    #  For a mock assistant message, the role is always 'assistant'
    #  @default 'assistant'
    # @param content [String] This is the content of the assistant message.
    #  This is the message that the assistant would have sent.
    # @param tool_calls [Array<Vapi::ChatEvalAssistantMessageMockToolCall>] This is the tool calls that will be made by the assistant.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatEvalAssistantMessageMock]
    def initialize(role:, content: OMIT, tool_calls: OMIT, additional_properties: nil)
      @role = role
      @content = content if content != OMIT
      @tool_calls = tool_calls if tool_calls != OMIT
      @additional_properties = additional_properties
      @_field_set = { "role": role, "content": content, "toolCalls": tool_calls }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatEvalAssistantMessageMock
    #
    # @param json_object [String]
    # @return [Vapi::ChatEvalAssistantMessageMock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      content = parsed_json["content"]
      tool_calls = parsed_json["toolCalls"]&.map do |item|
        item = item.to_json
        Vapi::ChatEvalAssistantMessageMockToolCall.from_json(json_object: item)
      end
      new(
        role: role,
        content: content,
        tool_calls: tool_calls,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatEvalAssistantMessageMock to a JSON object
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
      obj.role.is_a?(Vapi::ChatEvalAssistantMessageMockRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.tool_calls&.is_a?(Array) != false || raise("Passed value for field obj.tool_calls is not the expected type, validation failed.")
    end
  end
end
