# frozen_string_literal: true

require_relative "create_workflow_block_dto_messages_item"
require_relative "json_schema"
require_relative "create_workflow_block_dto_steps_item"
require "ostruct"
require "json"

module Vapi
  class CreateWorkflowBlockDto
    # @return [Array<Vapi::CreateWorkflowBlockDtoMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
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
    # @return [Array<Vapi::CreateWorkflowBlockDtoStepsItem>] These are the steps in the workflow.
    attr_reader :steps
    # @return [String] This is the name of the block. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::CreateWorkflowBlockDtoMessagesItem>] These are the pre-configured messages that will be spoken to the user while the
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
    # @param steps [Array<Vapi::CreateWorkflowBlockDtoStepsItem>] These are the steps in the workflow.
    # @param name [String] This is the name of the block. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWorkflowBlockDto]
    def initialize(messages: OMIT, input_schema: OMIT, output_schema: OMIT, steps: OMIT, name: OMIT,
                   additional_properties: nil)
      @messages = messages if messages != OMIT
      @input_schema = input_schema if input_schema != OMIT
      @output_schema = output_schema if output_schema != OMIT
      @steps = steps if steps != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "inputSchema": input_schema,
        "outputSchema": output_schema,
        "steps": steps,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateWorkflowBlockDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateWorkflowBlockDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::CreateWorkflowBlockDtoMessagesItem.from_json(json_object: item)
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
      steps = parsed_json["steps"]&.map do |item|
        item = item.to_json
        Vapi::CreateWorkflowBlockDtoStepsItem.from_json(json_object: item)
      end
      name = parsed_json["name"]
      new(
        messages: messages,
        input_schema: input_schema,
        output_schema: output_schema,
        steps: steps,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateWorkflowBlockDto to a JSON object
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
      obj.steps&.is_a?(Array) != false || raise("Passed value for field obj.steps is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
