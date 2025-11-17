# frozen_string_literal: true

require_relative "chat_eval_assistant_message_mock_tool_call"
require "ostruct"
require "json"

module Vapi
  class AssistantMessageJudgePlanExact
    # @return [String] This is what that will be used to evaluate the model's message content.
    #  If you provide a string, the assistant message content will be evaluated against
    #  it as an exact match, case-insensitive.
    attr_reader :content
    # @return [Array<Vapi::ChatEvalAssistantMessageMockToolCall>] This is the tool calls that will be used to evaluate the model's message
    #  content.
    #  The tool name must be a valid tool that the assistant is allowed to call.
    #  For the Query tool, the arguments for the tool call are in the format -
    #  {knowledgeBaseNames: ['kb_name', 'kb_name_2']}
    #  For the DTMF tool, the arguments for the tool call are in the format - {dtmf:
    #  "1234*"}
    #  For the Handoff tool, the arguments for the tool call are in the format -
    #  {destination: "assistant_id"}
    #  For the Transfer Call tool, the arguments for the tool call are in the format -
    #  {destination: "phone_number_or_assistant_id"}
    #  For all other tools, they are called without arguments or with user-defined
    #  arguments
    attr_reader :tool_calls
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param content [String] This is what that will be used to evaluate the model's message content.
    #  If you provide a string, the assistant message content will be evaluated against
    #  it as an exact match, case-insensitive.
    # @param tool_calls [Array<Vapi::ChatEvalAssistantMessageMockToolCall>] This is the tool calls that will be used to evaluate the model's message
    #  content.
    #  The tool name must be a valid tool that the assistant is allowed to call.
    #  For the Query tool, the arguments for the tool call are in the format -
    #  {knowledgeBaseNames: ['kb_name', 'kb_name_2']}
    #  For the DTMF tool, the arguments for the tool call are in the format - {dtmf:
    #  "1234*"}
    #  For the Handoff tool, the arguments for the tool call are in the format -
    #  {destination: "assistant_id"}
    #  For the Transfer Call tool, the arguments for the tool call are in the format -
    #  {destination: "phone_number_or_assistant_id"}
    #  For all other tools, they are called without arguments or with user-defined
    #  arguments
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantMessageJudgePlanExact]
    def initialize(content:, tool_calls: OMIT, additional_properties: nil)
      @content = content
      @tool_calls = tool_calls if tool_calls != OMIT
      @additional_properties = additional_properties
      @_field_set = { "content": content, "toolCalls": tool_calls }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssistantMessageJudgePlanExact
    #
    # @param json_object [String]
    # @return [Vapi::AssistantMessageJudgePlanExact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      content = parsed_json["content"]
      tool_calls = parsed_json["toolCalls"]&.map do |item|
        item = item.to_json
        Vapi::ChatEvalAssistantMessageMockToolCall.from_json(json_object: item)
      end
      new(
        content: content,
        tool_calls: tool_calls,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantMessageJudgePlanExact to a JSON object
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
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.tool_calls&.is_a?(Array) != false || raise("Passed value for field obj.tool_calls is not the expected type, validation failed.")
    end
  end
end
