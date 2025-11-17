# frozen_string_literal: true

require_relative "tool_call_hook_action_type"
require_relative "tool_call_hook_action_tool"
require "ostruct"
require "json"

module Vapi
  class ToolCallHookAction
    # @return [Vapi::ToolCallHookActionType] This is the type of action - must be "tool"
    attr_reader :type
    # @return [Vapi::ToolCallHookActionTool] This is the tool to call. To use an existing tool, send `toolId` instead.
    attr_reader :tool
    # @return [String] This is the tool to call. To use a transient tool, send `tool` instead.
    attr_reader :tool_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::ToolCallHookActionType] This is the type of action - must be "tool"
    # @param tool [Vapi::ToolCallHookActionTool] This is the tool to call. To use an existing tool, send `toolId` instead.
    # @param tool_id [String] This is the tool to call. To use a transient tool, send `tool` instead.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCallHookAction]
    def initialize(type:, tool: OMIT, tool_id: OMIT, additional_properties: nil)
      @type = type
      @tool = tool if tool != OMIT
      @tool_id = tool_id if tool_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "tool": tool, "toolId": tool_id }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolCallHookAction
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallHookAction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      if parsed_json["tool"].nil?
        tool = nil
      else
        tool = parsed_json["tool"].to_json
        tool = Vapi::ToolCallHookActionTool.from_json(json_object: tool)
      end
      tool_id = parsed_json["toolId"]
      new(
        type: type,
        tool: tool,
        tool_id: tool_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolCallHookAction to a JSON object
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
      obj.type.is_a?(Vapi::ToolCallHookActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.tool.nil? || Vapi::ToolCallHookActionTool.validate_raw(obj: obj.tool)
      obj.tool_id&.is_a?(String) != false || raise("Passed value for field obj.tool_id is not the expected type, validation failed.")
    end
  end
end
