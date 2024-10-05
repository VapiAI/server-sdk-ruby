# frozen_string_literal: true

require_relative "tool_call_block_messages_item"
require_relative "json_schema"
require_relative "tool_call_block_tool"
require "date"
require "ostruct"
require "json"

module Vapi
  class ToolCallBlock
    # @return [Array<Vapi::ToolCallBlockMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
    #  block is running.
    attr_reader :messages
    # @return [Vapi::JsonSchema] This is the input schema for the block. This is the input the block needs to
    #  run. It's given to the block as `steps[0].input`
    #  These are accessible as variables:
    #  - ({{input.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.input.propertyName}}) in context of the workflow
    attr_reader :input_schema
    # @return [Vapi::JsonSchema] This is the output schema for the block. This is the output the block will
    #  return to the workflow (`{{stepName.output}}`).
    #  These are accessible as variables:
    #  - ({{output.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.output.propertyName}}) in context of the workflow (read caveat #1)
    #  - ({{blockName.output.propertyName}}) in context of the workflow (read caveat
    #  #2)
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow with steps.
    attr_reader :output_schema
    # @return [String]
    attr_reader :type
    # @return [Vapi::ToolCallBlockTool] This is the tool that the block will call. To use an existing tool, use
    #  `toolId`.
    attr_reader :tool
    # @return [String] This is the unique identifier for the block.
    attr_reader :id
    # @return [String] This is the unique identifier for the organization that this block belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the block was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the block was last updated.
    attr_reader :updated_at
    # @return [String] This is the name of the block. This is just for your reference.
    attr_reader :name
    # @return [String] This is the id of the tool that the block will call. To use a transient tool,
    #  use `tool`.
    attr_reader :tool_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::ToolCallBlockMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
    #  block is running.
    # @param input_schema [Vapi::JsonSchema] This is the input schema for the block. This is the input the block needs to
    #  run. It's given to the block as `steps[0].input`
    #  These are accessible as variables:
    #  - ({{input.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.input.propertyName}}) in context of the workflow
    # @param output_schema [Vapi::JsonSchema] This is the output schema for the block. This is the output the block will
    #  return to the workflow (`{{stepName.output}}`).
    #  These are accessible as variables:
    #  - ({{output.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.output.propertyName}}) in context of the workflow (read caveat #1)
    #  - ({{blockName.output.propertyName}}) in context of the workflow (read caveat
    #  #2)
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow with steps.
    # @param type [String]
    # @param tool [Vapi::ToolCallBlockTool] This is the tool that the block will call. To use an existing tool, use
    #  `toolId`.
    # @param id [String] This is the unique identifier for the block.
    # @param org_id [String] This is the unique identifier for the organization that this block belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the block was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the block was last updated.
    # @param name [String] This is the name of the block. This is just for your reference.
    # @param tool_id [String] This is the id of the tool that the block will call. To use a transient tool,
    #  use `tool`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCallBlock]
    def initialize(type:, id:, org_id:, created_at:, updated_at:, messages: OMIT, input_schema: OMIT,
                   output_schema: OMIT, tool: OMIT, name: OMIT, tool_id: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @input_schema = input_schema if input_schema != OMIT
      @output_schema = output_schema if output_schema != OMIT
      @type = type
      @tool = tool if tool != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @tool_id = tool_id if tool_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "inputSchema": input_schema,
        "outputSchema": output_schema,
        "type": type,
        "tool": tool,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "toolId": tool_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolCallBlock
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ToolCallBlockMessagesItem.from_json(json_object: item)
      end
      if parsed_json["inputSchema"].nil?
        input_schema = nil
      else
        input_schema = parsed_json["inputSchema"].to_json
        input_schema = Vapi::JsonSchema.from_json(json_object: input_schema)
      end
      if parsed_json["outputSchema"].nil?
        output_schema = nil
      else
        output_schema = parsed_json["outputSchema"].to_json
        output_schema = Vapi::JsonSchema.from_json(json_object: output_schema)
      end
      type = parsed_json["type"]
      if parsed_json["tool"].nil?
        tool = nil
      else
        tool = parsed_json["tool"].to_json
        tool = Vapi::ToolCallBlockTool.from_json(json_object: tool)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      tool_id = parsed_json["toolId"]
      new(
        messages: messages,
        input_schema: input_schema,
        output_schema: output_schema,
        type: type,
        tool: tool,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        tool_id: tool_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolCallBlock to a JSON object
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
      obj.input_schema.nil? || Vapi::JsonSchema.validate_raw(obj: obj.input_schema)
      obj.output_schema.nil? || Vapi::JsonSchema.validate_raw(obj: obj.output_schema)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.tool.nil? || Vapi::ToolCallBlockTool.validate_raw(obj: obj.tool)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tool_id&.is_a?(String) != false || raise("Passed value for field obj.tool_id is not the expected type, validation failed.")
    end
  end
end
