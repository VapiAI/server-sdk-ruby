# frozen_string_literal: true

require_relative "conversation_block_messages_item"
require_relative "json_schema"
require "date"
require "ostruct"
require "json"

module Vapi
  class ConversationBlock
    # @return [Array<Vapi::ConversationBlockMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
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
    # @return [String] This is the instruction to the model.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{input.your-property-name}}" for the current step's input
    #  - "{{your-step-name.output.your-property-name}}" for another step's output (in
    #  the same workflow; read caveat #1)
    #  - "{{your-step-name.input.your-property-name}}" for another step's input (in the
    #  same workflow; read caveat #1)
    #  - "{{your-block-name.output.your-property-name}}" for another block's output (in
    #  the same workflow; read caveat #2)
    #  - "{{your-block-name.input.your-property-name}}" for another block's input (in
    #  the same workflow; read caveat #2)
    #  - "{{workflow.input.your-property-name}}" for the current workflow's input
    #  - "{{global.your-property-name}}" for the global context
    #  This can be as simple or as complex as you want it to be.
    #  - "say hello and ask the user about their day!"
    #  - "collect the user's first and last name"
    #  - "user is {{input.firstName}} {{input.lastName}}. their age is {{input.age}}.
    #  ask them about their salary and if they might be interested in buying a house.
    #  we offer {{input.offer}}"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output/input.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output/input.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    attr_reader :instruction
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::ConversationBlockMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
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
    # @param id [String] This is the unique identifier for the block.
    # @param org_id [String] This is the unique identifier for the organization that this block belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the block was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the block was last updated.
    # @param name [String] This is the name of the block. This is just for your reference.
    # @param instruction [String] This is the instruction to the model.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{input.your-property-name}}" for the current step's input
    #  - "{{your-step-name.output.your-property-name}}" for another step's output (in
    #  the same workflow; read caveat #1)
    #  - "{{your-step-name.input.your-property-name}}" for another step's input (in the
    #  same workflow; read caveat #1)
    #  - "{{your-block-name.output.your-property-name}}" for another block's output (in
    #  the same workflow; read caveat #2)
    #  - "{{your-block-name.input.your-property-name}}" for another block's input (in
    #  the same workflow; read caveat #2)
    #  - "{{workflow.input.your-property-name}}" for the current workflow's input
    #  - "{{global.your-property-name}}" for the global context
    #  This can be as simple or as complex as you want it to be.
    #  - "say hello and ask the user about their day!"
    #  - "collect the user's first and last name"
    #  - "user is {{input.firstName}} {{input.lastName}}. their age is {{input.age}}.
    #  ask them about their salary and if they might be interested in buying a house.
    #  we offer {{input.offer}}"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output/input.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output/input.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ConversationBlock]
    def initialize(type:, id:, org_id:, created_at:, updated_at:, instruction:, messages: OMIT, input_schema: OMIT,
                   output_schema: OMIT, name: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @input_schema = input_schema if input_schema != OMIT
      @output_schema = output_schema if output_schema != OMIT
      @type = type
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @instruction = instruction
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "inputSchema": input_schema,
        "outputSchema": output_schema,
        "type": type,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "instruction": instruction
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ConversationBlock
    #
    # @param json_object [String]
    # @return [Vapi::ConversationBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ConversationBlockMessagesItem.from_json(json_object: item)
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
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      instruction = parsed_json["instruction"]
      new(
        messages: messages,
        input_schema: input_schema,
        output_schema: output_schema,
        type: type,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        instruction: instruction,
        additional_properties: struct
      )
    end

    # Serialize an instance of ConversationBlock to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.instruction.is_a?(String) != false || raise("Passed value for field obj.instruction is not the expected type, validation failed.")
    end
  end
end
