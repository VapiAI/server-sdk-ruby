# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ModelBasedCondition
    # @return [String] This is the instruction which should output a boolean value when passed to a
    #  model.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{output.your-property-name}}" for current step's output
    #  - "{{input.your-property-name}}" for current step's input
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
    #  You can also talk about the current step's output or input directly:
    #  - "{{output.your-property-name}} is greater than 10"
    #  - "{{input.your-property-name}} is greater than 10"
    #  Examples:
    #  - "{{input.age}} is greater than 10"
    #  - "{{input.age}} is greater than {{input.age2}}"
    #  - "{{output.age}} is greater than 10"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    attr_reader :instruction
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param instruction [String] This is the instruction which should output a boolean value when passed to a
    #  model.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{output.your-property-name}}" for current step's output
    #  - "{{input.your-property-name}}" for current step's input
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
    #  You can also talk about the current step's output or input directly:
    #  - "{{output.your-property-name}} is greater than 10"
    #  - "{{input.your-property-name}} is greater than 10"
    #  Examples:
    #  - "{{input.age}} is greater than 10"
    #  - "{{input.age}} is greater than {{input.age2}}"
    #  - "{{output.age}} is greater than 10"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ModelBasedCondition]
    def initialize(instruction:, additional_properties: nil)
      @instruction = instruction
      @additional_properties = additional_properties
      @_field_set = { "instruction": instruction }
    end

    # Deserialize a JSON object to an instance of ModelBasedCondition
    #
    # @param json_object [String]
    # @return [Vapi::ModelBasedCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      instruction = parsed_json["instruction"]
      new(instruction: instruction, additional_properties: struct)
    end

    # Serialize an instance of ModelBasedCondition to a JSON object
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
      obj.instruction.is_a?(String) != false || raise("Passed value for field obj.instruction is not the expected type, validation failed.")
    end
  end
end
