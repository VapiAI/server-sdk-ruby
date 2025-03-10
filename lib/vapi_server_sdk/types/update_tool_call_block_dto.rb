# frozen_string_literal: true

require_relative "update_tool_call_block_dto_messages_item"
require_relative "json_schema"
require_relative "update_tool_call_block_dto_tool"
require "ostruct"
require "json"

module Vapi
  class UpdateToolCallBlockDto
    # @return [Array<Vapi::UpdateToolCallBlockDtoMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
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
    # @return [Vapi::UpdateToolCallBlockDtoTool] This is the tool that the block will call. To use an existing tool, use
    #  `toolId`.
    attr_reader :tool
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

    # @param messages [Array<Vapi::UpdateToolCallBlockDtoMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
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
    # @param tool [Vapi::UpdateToolCallBlockDtoTool] This is the tool that the block will call. To use an existing tool, use
    #  `toolId`.
    # @param name [String] This is the name of the block. This is just for your reference.
    # @param tool_id [String] This is the id of the tool that the block will call. To use a transient tool,
    #  use `tool`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateToolCallBlockDto]
    def initialize(messages: OMIT, input_schema: OMIT, output_schema: OMIT, tool: OMIT, name: OMIT, tool_id: OMIT,
                   additional_properties: nil)
      @messages = messages if messages != OMIT
      @input_schema = input_schema if input_schema != OMIT
      @output_schema = output_schema if output_schema != OMIT
      @tool = tool if tool != OMIT
      @name = name if name != OMIT
      @tool_id = tool_id if tool_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "inputSchema": input_schema,
        "outputSchema": output_schema,
        "tool": tool,
        "name": name,
        "toolId": tool_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateToolCallBlockDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateToolCallBlockDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::UpdateToolCallBlockDtoMessagesItem.from_json(json_object: item)
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
      if parsed_json["tool"].nil?
        tool = nil
      else
        tool = parsed_json["tool"].to_json
        tool = Vapi::UpdateToolCallBlockDtoTool.from_json(json_object: tool)
      end
      name = parsed_json["name"]
      tool_id = parsed_json["toolId"]
      new(
        messages: messages,
        input_schema: input_schema,
        output_schema: output_schema,
        tool: tool,
        name: name,
        tool_id: tool_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateToolCallBlockDto to a JSON object
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
      obj.tool.nil? || Vapi::UpdateToolCallBlockDtoTool.validate_raw(obj: obj.tool)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tool_id&.is_a?(String) != false || raise("Passed value for field obj.tool_id is not the expected type, validation failed.")
    end
  end
end
