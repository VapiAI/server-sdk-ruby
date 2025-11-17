# frozen_string_literal: true

require_relative "tool_message_role"
require "ostruct"
require "json"

module Vapi
  class ToolMessage
    # @return [Vapi::ToolMessageRole] This is the role of the message author
    attr_reader :role
    # @return [String] This is the content of the tool message
    attr_reader :content
    # @return [String] This is the ID of the tool call this message is responding to
    attr_reader :tool_call_id
    # @return [String] This is an optional name for the participant
    attr_reader :name
    # @return [Hash{String => Object}] This is an optional metadata for the message
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::ToolMessageRole] This is the role of the message author
    # @param content [String] This is the content of the tool message
    # @param tool_call_id [String] This is the ID of the tool call this message is responding to
    # @param name [String] This is an optional name for the participant
    # @param metadata [Hash{String => Object}] This is an optional metadata for the message
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolMessage]
    def initialize(role:, content:, tool_call_id:, name: OMIT, metadata: OMIT, additional_properties: nil)
      @role = role
      @content = content
      @tool_call_id = tool_call_id
      @name = name if name != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "role": role,
        "content": content,
        "tool_call_id": tool_call_id,
        "name": name,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolMessage
    #
    # @param json_object [String]
    # @return [Vapi::ToolMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      content = parsed_json["content"]
      tool_call_id = parsed_json["tool_call_id"]
      name = parsed_json["name"]
      metadata = parsed_json["metadata"]
      new(
        role: role,
        content: content,
        tool_call_id: tool_call_id,
        name: name,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolMessage to a JSON object
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
      obj.role.is_a?(Vapi::ToolMessageRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.tool_call_id.is_a?(String) != false || raise("Passed value for field obj.tool_call_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
