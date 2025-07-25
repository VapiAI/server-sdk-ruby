# frozen_string_literal: true

require_relative "tool_call"
require "ostruct"
require "json"

module Vapi
  class AssistantMessage
    # @return [String] This is the role of the message author
    attr_reader :role
    # @return [String] This is the content of the assistant message
    attr_reader :content
    # @return [String] This is the refusal message generated by the model
    attr_reader :refusal
    # @return [Array<Vapi::ToolCall>] This is the tool calls generated by the model
    attr_reader :tool_calls
    # @return [String] This is an optional name for the participant
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [String] This is the role of the message author
    # @param content [String] This is the content of the assistant message
    # @param refusal [String] This is the refusal message generated by the model
    # @param tool_calls [Array<Vapi::ToolCall>] This is the tool calls generated by the model
    # @param name [String] This is an optional name for the participant
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantMessage]
    def initialize(role:, content: OMIT, refusal: OMIT, tool_calls: OMIT, name: OMIT, additional_properties: nil)
      @role = role
      @content = content if content != OMIT
      @refusal = refusal if refusal != OMIT
      @tool_calls = tool_calls if tool_calls != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "role": role,
        "content": content,
        "refusal": refusal,
        "tool_calls": tool_calls,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssistantMessage
    #
    # @param json_object [String]
    # @return [Vapi::AssistantMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      content = parsed_json["content"]
      refusal = parsed_json["refusal"]
      tool_calls = parsed_json["tool_calls"]&.map do |item|
        item = item.to_json
        Vapi::ToolCall.from_json(json_object: item)
      end
      name = parsed_json["name"]
      new(
        role: role,
        content: content,
        refusal: refusal,
        tool_calls: tool_calls,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantMessage to a JSON object
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
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.refusal&.is_a?(String) != false || raise("Passed value for field obj.refusal is not the expected type, validation failed.")
      obj.tool_calls&.is_a?(Array) != false || raise("Passed value for field obj.tool_calls is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
