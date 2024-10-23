# frozen_string_literal: true

require_relative "rule_based_condition_operator"
require "ostruct"
require "json"

module Vapi
  class RuleBasedCondition
    # @return [Vapi::RuleBasedConditionOperator] This is the operator you want to use to compare the left side and right side.
    #  The operation becomes `(leftSide) operator (rightSide)`.
    attr_reader :operator
    # @return [String] This is the left side of the operation.
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
    #  Or, you can use a constant:
    #  - "1"
    #  - "text"
    #  - "true"
    #  - "false"
    #  Or, you can mix and match with string interpolation:
    #  - "{{your-property-name}}-{{input.your-property-name-2}}-1"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    attr_reader :left_side
    # @return [String] This is the right side of the operation.
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
    #  Or, you can use a constant:
    #  - "1"
    #  - "text"
    #  - "true"
    #  - "false"
    #  Or, you can mix and match with string interpolation:
    #  - "{{your-property-name}}-{{input.your-property-name-2}}-1"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    attr_reader :right_side
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param operator [Vapi::RuleBasedConditionOperator] This is the operator you want to use to compare the left side and right side.
    #  The operation becomes `(leftSide) operator (rightSide)`.
    # @param left_side [String] This is the left side of the operation.
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
    #  Or, you can use a constant:
    #  - "1"
    #  - "text"
    #  - "true"
    #  - "false"
    #  Or, you can mix and match with string interpolation:
    #  - "{{your-property-name}}-{{input.your-property-name-2}}-1"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    # @param right_side [String] This is the right side of the operation.
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
    #  Or, you can use a constant:
    #  - "1"
    #  - "text"
    #  - "true"
    #  - "false"
    #  Or, you can mix and match with string interpolation:
    #  - "{{your-property-name}}-{{input.your-property-name-2}}-1"
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
    # @return [Vapi::RuleBasedCondition]
    def initialize(operator:, left_side:, right_side:, additional_properties: nil)
      @operator = operator
      @left_side = left_side
      @right_side = right_side
      @additional_properties = additional_properties
      @_field_set = { "operator": operator, "leftSide": left_side, "rightSide": right_side }
    end

    # Deserialize a JSON object to an instance of RuleBasedCondition
    #
    # @param json_object [String]
    # @return [Vapi::RuleBasedCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      operator = parsed_json["operator"]
      left_side = parsed_json["leftSide"]
      right_side = parsed_json["rightSide"]
      new(
        operator: operator,
        left_side: left_side,
        right_side: right_side,
        additional_properties: struct
      )
    end

    # Serialize an instance of RuleBasedCondition to a JSON object
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
      obj.operator.is_a?(Vapi::RuleBasedConditionOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.left_side.is_a?(String) != false || raise("Passed value for field obj.left_side is not the expected type, validation failed.")
      obj.right_side.is_a?(String) != false || raise("Passed value for field obj.right_side is not the expected type, validation failed.")
    end
  end
end
