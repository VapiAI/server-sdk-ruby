# frozen_string_literal: true
require_relative "tool_node_tool"
require "ostruct"
require "json"

module Vapi
  class ToolNode
  # @return [Vapi::ToolNodeTool] This is the tool to call. To use an existing tool, send `toolId` instead.
    attr_reader :tool
  # @return [String] This is the tool to call. To use a transient tool, send `tool` instead.
    attr_reader :tool_id
  # @return [String] 
    attr_reader :name
  # @return [Boolean] This is whether or not the node is the start of the workflow.
    attr_reader :is_start
  # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param tool [Vapi::ToolNodeTool] This is the tool to call. To use an existing tool, send `toolId` instead.
    # @param tool_id [String] This is the tool to call. To use a transient tool, send `tool` instead.
    # @param name [String] 
    # @param is_start [Boolean] This is whether or not the node is the start of the workflow.
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolNode]
    def initialize(tool: OMIT, tool_id: OMIT, name:, is_start: OMIT, metadata: OMIT, additional_properties: nil)
      @tool = tool if tool != OMIT
      @tool_id = tool_id if tool_id != OMIT
      @name = name
      @is_start = is_start if is_start != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "tool": tool, "toolId": tool_id, "name": name, "isStart": is_start, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ToolNode
    #
    # @param json_object [String] 
    # @return [Vapi::ToolNode]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["tool"].nil?
        tool = parsed_json["tool"].to_json
        tool = Vapi::ToolNodeTool.from_json(json_object: tool)
      else
        tool = nil
      end
      tool_id = parsed_json["toolId"]
      name = parsed_json["name"]
      is_start = parsed_json["isStart"]
      metadata = parsed_json["metadata"]
      new(
        tool: tool,
        tool_id: tool_id,
        name: name,
        is_start: is_start,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of ToolNode to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.tool.nil? || Vapi::ToolNodeTool.validate_raw(obj: obj.tool)
      obj.tool_id&.is_a?(String) != false || raise("Passed value for field obj.tool_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.is_start&.is_a?(Boolean) != false || raise("Passed value for field obj.is_start is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end