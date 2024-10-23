# frozen_string_literal: true

require_relative "callback_step_block"
require_relative "assignment_mutation"
require "ostruct"
require "json"

module Vapi
  class CallbackStep
    # @return [Vapi::CallbackStepBlock] This is the block to use. To use an existing block, use `blockId`.
    attr_reader :block
    # @return [Array<Vapi::AssignmentMutation>] This is the mutations to apply to the context after the step is done.
    attr_reader :mutations
    # @return [String] This is the name of the step.
    attr_reader :name
    # @return [String] This is the id of the block to use. To use a transient block, use `block`.
    attr_reader :block_id
    # @return [Hash{String => Object}] This is the input to the block. You can use any key-value map as input to the
    #  block.
    #  Example:
    #  {
    #  "name": "John Doe",
    #  "age": 20
    #  }
    #  You can reference any variable in the context of the current block:
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
    #  Example:
    #  {
    #  "name": "{{my-tool-call-step.output.name}}",
    #  "age": "{{my-tool-call-step.input.age}}",
    #  "date": "{{workflow.input.date}}"
    #  }
    #  You can dynamically change the key name.
    #  Example:
    #  {
    #  "{{my-tool-call-step.output.key-name-for-name}}": "{{name}}",
    #  "{{my-tool-call-step.input.key-name-for-age}}": "{{age}}",
    #  "{{workflow.input.key-name-for-date}}": "{{date}}"
    #  }
    #  You can represent the value as a string, number, boolean, array, or object.
    #  Example:
    #  {
    #  "name": "john",
    #  "age": 20,
    #  "date": "2021-01-01",
    #  "metadata": {
    #  "unique-key": "{{my-tool-call-step.output.unique-key}}"
    #  },
    #  "array": ["A", "B", "C"],
    #  }
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow.
    attr_reader :input
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param block [Vapi::CallbackStepBlock] This is the block to use. To use an existing block, use `blockId`.
    # @param mutations [Array<Vapi::AssignmentMutation>] This is the mutations to apply to the context after the step is done.
    # @param name [String] This is the name of the step.
    # @param block_id [String] This is the id of the block to use. To use a transient block, use `block`.
    # @param input [Hash{String => Object}] This is the input to the block. You can use any key-value map as input to the
    #  block.
    #  Example:
    #  {
    #  "name": "John Doe",
    #  "age": 20
    #  }
    #  You can reference any variable in the context of the current block:
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
    #  Example:
    #  {
    #  "name": "{{my-tool-call-step.output.name}}",
    #  "age": "{{my-tool-call-step.input.age}}",
    #  "date": "{{workflow.input.date}}"
    #  }
    #  You can dynamically change the key name.
    #  Example:
    #  {
    #  "{{my-tool-call-step.output.key-name-for-name}}": "{{name}}",
    #  "{{my-tool-call-step.input.key-name-for-age}}": "{{age}}",
    #  "{{workflow.input.key-name-for-date}}": "{{date}}"
    #  }
    #  You can represent the value as a string, number, boolean, array, or object.
    #  Example:
    #  {
    #  "name": "john",
    #  "age": 20,
    #  "date": "2021-01-01",
    #  "metadata": {
    #  "unique-key": "{{my-tool-call-step.output.unique-key}}"
    #  },
    #  "array": ["A", "B", "C"],
    #  }
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.input/output.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.input/output.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CallbackStep]
    def initialize(name:, block: OMIT, mutations: OMIT, block_id: OMIT, input: OMIT, additional_properties: nil)
      @block = block if block != OMIT
      @mutations = mutations if mutations != OMIT
      @name = name
      @block_id = block_id if block_id != OMIT
      @input = input if input != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "block": block,
        "mutations": mutations,
        "name": name,
        "blockId": block_id,
        "input": input
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CallbackStep
    #
    # @param json_object [String]
    # @return [Vapi::CallbackStep]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["block"].nil?
        block = nil
      else
        block = parsed_json["block"].to_json
        block = Vapi::CallbackStepBlock.from_json(json_object: block)
      end
      mutations = parsed_json["mutations"]&.map do |item|
        item = item.to_json
        Vapi::AssignmentMutation.from_json(json_object: item)
      end
      name = parsed_json["name"]
      block_id = parsed_json["blockId"]
      input = parsed_json["input"]
      new(
        block: block,
        mutations: mutations,
        name: name,
        block_id: block_id,
        input: input,
        additional_properties: struct
      )
    end

    # Serialize an instance of CallbackStep to a JSON object
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
      obj.block.nil? || Vapi::CallbackStepBlock.validate_raw(obj: obj.block)
      obj.mutations&.is_a?(Array) != false || raise("Passed value for field obj.mutations is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.block_id&.is_a?(String) != false || raise("Passed value for field obj.block_id is not the expected type, validation failed.")
      obj.input&.is_a?(Hash) != false || raise("Passed value for field obj.input is not the expected type, validation failed.")
    end
  end
end
