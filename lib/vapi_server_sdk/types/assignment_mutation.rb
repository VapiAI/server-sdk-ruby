# frozen_string_literal: true

require_relative "assignment_mutation_conditions_item"
require "ostruct"
require "json"

module Vapi
  class AssignmentMutation
    # @return [Array<Vapi::AssignmentMutationConditionsItem>] This is an optional array of conditions that must be met for this mutation to be
    #  triggered.
    attr_reader :conditions
    # @return [String] This mutation assigns a new value to an existing or new variable.
    attr_reader :type
    # @return [String] This is the variable to assign a new value to.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "output.your-property-name" for current step's output
    #  - "your-step-name.output.your-property-name" for another step's output (in the
    #  same workflow; read caveat #1)
    #  - "your-block-name.output.your-property-name" for another block's output (in the
    #  same workflow; read caveat #2)
    #  - "global.your-property-name" for the global context
    #  This needs to be the key path of the variable. If you use {{}}, it'll
    #  dereference that to the value of the variable before assignment. This can be
    #  useful if the path is dynamic. Example:
    #  - "global.{{my-tool-call-step.output.my-key-name}}"
    #  You can also string interpolate multiple variables to get the key name:
    #  -
    #  -call-step.output.my-key-name-suffix}}-{{my-tool-call-step.output.my-key-name}}"
    #  The path to the new variable is created if it doesn't exist. Example:
    #  - "global.this-does-not-exist.neither-does-this" will create
    #  `this-does-not-exist` object with `neither-does-this` as a key
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow.
    attr_reader :variable
    # @return [String] The value to assign to the variable.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{output.your-property-name}}" for current step's output
    #  - "{{your-step-name.output.your-property-name}}" for another step's output (in
    #  the same workflow; read caveat #1)
    #  - "{{your-block-name.output.your-property-name}}" for another block's output (in
    #  the same workflow; read caveat #2)
    #  - "{{global.your-property-name}}" for the global context
    #  Or, you can use a constant:
    #  - "1"
    #  - "text"
    #  - "true"
    #  - "false"
    #  Or, you can mix and match with string interpolation:
    #  - "{{your-property-name}}-{{input.your-property-name-2}}-1"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param conditions [Array<Vapi::AssignmentMutationConditionsItem>] This is an optional array of conditions that must be met for this mutation to be
    #  triggered.
    # @param type [String] This mutation assigns a new value to an existing or new variable.
    # @param variable [String] This is the variable to assign a new value to.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "output.your-property-name" for current step's output
    #  - "your-step-name.output.your-property-name" for another step's output (in the
    #  same workflow; read caveat #1)
    #  - "your-block-name.output.your-property-name" for another block's output (in the
    #  same workflow; read caveat #2)
    #  - "global.your-property-name" for the global context
    #  This needs to be the key path of the variable. If you use {{}}, it'll
    #  dereference that to the value of the variable before assignment. This can be
    #  useful if the path is dynamic. Example:
    #  - "global.{{my-tool-call-step.output.my-key-name}}"
    #  You can also string interpolate multiple variables to get the key name:
    #  -
    #  -call-step.output.my-key-name-suffix}}-{{my-tool-call-step.output.my-key-name}}"
    #  The path to the new variable is created if it doesn't exist. Example:
    #  - "global.this-does-not-exist.neither-does-this" will create
    #  `this-does-not-exist` object with `neither-does-this` as a key
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow.
    # @param value [String] The value to assign to the variable.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{output.your-property-name}}" for current step's output
    #  - "{{your-step-name.output.your-property-name}}" for another step's output (in
    #  the same workflow; read caveat #1)
    #  - "{{your-block-name.output.your-property-name}}" for another block's output (in
    #  the same workflow; read caveat #2)
    #  - "{{global.your-property-name}}" for the global context
    #  Or, you can use a constant:
    #  - "1"
    #  - "text"
    #  - "true"
    #  - "false"
    #  Or, you can mix and match with string interpolation:
    #  - "{{your-property-name}}-{{input.your-property-name-2}}-1"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssignmentMutation]
    def initialize(type:, variable:, value:, conditions: OMIT, additional_properties: nil)
      @conditions = conditions if conditions != OMIT
      @type = type
      @variable = variable
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "conditions": conditions, "type": type, "variable": variable, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssignmentMutation
    #
    # @param json_object [String]
    # @return [Vapi::AssignmentMutation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::AssignmentMutationConditionsItem.from_json(json_object: item)
      end
      type = parsed_json["type"]
      variable = parsed_json["variable"]
      value = parsed_json["value"]
      new(
        conditions: conditions,
        type: type,
        variable: variable,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssignmentMutation to a JSON object
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
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.variable.is_a?(String) != false || raise("Passed value for field obj.variable is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
