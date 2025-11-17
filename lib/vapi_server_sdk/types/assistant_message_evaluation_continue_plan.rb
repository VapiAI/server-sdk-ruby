# frozen_string_literal: true

require_relative "chat_eval_assistant_message_mock_tool_call"
require "ostruct"
require "json"

module Vapi
  class AssistantMessageEvaluationContinuePlan
    # @return [Boolean] This is whether the evaluation should exit if the assistant message evaluates to
    #  false.
    #  By default, it is false and the evaluation will continue.
    #  @default false
    attr_reader :exit_on_failure_enabled
    # @return [String] This is the content that will be used in the conversation for this assistant
    #  turn moving forward if provided.
    #  It will override the content received from the model.
    attr_reader :content_override
    # @return [Array<Vapi::ChatEvalAssistantMessageMockToolCall>] This is the tool calls that will be used in the conversation for this assistant
    #  turn moving forward if provided.
    #  It will override the tool calls received from the model.
    attr_reader :tool_calls_override
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param exit_on_failure_enabled [Boolean] This is whether the evaluation should exit if the assistant message evaluates to
    #  false.
    #  By default, it is false and the evaluation will continue.
    #  @default false
    # @param content_override [String] This is the content that will be used in the conversation for this assistant
    #  turn moving forward if provided.
    #  It will override the content received from the model.
    # @param tool_calls_override [Array<Vapi::ChatEvalAssistantMessageMockToolCall>] This is the tool calls that will be used in the conversation for this assistant
    #  turn moving forward if provided.
    #  It will override the tool calls received from the model.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantMessageEvaluationContinuePlan]
    def initialize(exit_on_failure_enabled: OMIT, content_override: OMIT, tool_calls_override: OMIT,
                   additional_properties: nil)
      @exit_on_failure_enabled = exit_on_failure_enabled if exit_on_failure_enabled != OMIT
      @content_override = content_override if content_override != OMIT
      @tool_calls_override = tool_calls_override if tool_calls_override != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "exitOnFailureEnabled": exit_on_failure_enabled,
        "contentOverride": content_override,
        "toolCallsOverride": tool_calls_override
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  AssistantMessageEvaluationContinuePlan
    #
    # @param json_object [String]
    # @return [Vapi::AssistantMessageEvaluationContinuePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      exit_on_failure_enabled = parsed_json["exitOnFailureEnabled"]
      content_override = parsed_json["contentOverride"]
      tool_calls_override = parsed_json["toolCallsOverride"]&.map do |item|
        item = item.to_json
        Vapi::ChatEvalAssistantMessageMockToolCall.from_json(json_object: item)
      end
      new(
        exit_on_failure_enabled: exit_on_failure_enabled,
        content_override: content_override,
        tool_calls_override: tool_calls_override,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantMessageEvaluationContinuePlan to a JSON object
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
      obj.exit_on_failure_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.exit_on_failure_enabled is not the expected type, validation failed.")
      obj.content_override&.is_a?(String) != false || raise("Passed value for field obj.content_override is not the expected type, validation failed.")
      obj.tool_calls_override&.is_a?(Array) != false || raise("Passed value for field obj.tool_calls_override is not the expected type, validation failed.")
    end
  end
end
