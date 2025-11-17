# frozen_string_literal: true

require_relative "tool_rejection_plan_conditions_item"
require "ostruct"
require "json"

module Vapi
  class ToolRejectionPlan
    # @return [Array<Vapi::ToolRejectionPlanConditionsItem>] This is the list of conditions that must be evaluated.
    #  Usage:
    #  - If all conditions match (AND logic), the tool call is rejected.
    #  - For OR logic at the top level, use a single 'group' condition with operator:
    #  'OR'.
    #  @default [] - Empty array means tool always executes
    attr_reader :conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param conditions [Array<Vapi::ToolRejectionPlanConditionsItem>] This is the list of conditions that must be evaluated.
    #  Usage:
    #  - If all conditions match (AND logic), the tool call is rejected.
    #  - For OR logic at the top level, use a single 'group' condition with operator:
    #  'OR'.
    #  @default [] - Empty array means tool always executes
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolRejectionPlan]
    def initialize(conditions: OMIT, additional_properties: nil)
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "conditions": conditions }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolRejectionPlan
    #
    # @param json_object [String]
    # @return [Vapi::ToolRejectionPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::ToolRejectionPlanConditionsItem.from_json(json_object: item)
      end
      new(conditions: conditions, additional_properties: struct)
    end

    # Serialize an instance of ToolRejectionPlan to a JSON object
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
    end
  end
end
