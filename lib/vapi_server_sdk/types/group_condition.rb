# frozen_string_literal: true

require_relative "group_condition_operator"
require_relative "group_condition_conditions_item"
require "ostruct"
require "json"

module Vapi
  class GroupCondition
    # @return [Vapi::GroupConditionOperator] This is the logical operator for combining conditions in this group
    attr_reader :operator
    # @return [Array<Vapi::GroupConditionConditionsItem>] This is the list of nested conditions to evaluate.
    #  Supports recursive nesting of groups for complex logic.
    attr_reader :conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param operator [Vapi::GroupConditionOperator] This is the logical operator for combining conditions in this group
    # @param conditions [Array<Vapi::GroupConditionConditionsItem>] This is the list of nested conditions to evaluate.
    #  Supports recursive nesting of groups for complex logic.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GroupCondition]
    def initialize(operator:, conditions:, additional_properties: nil)
      @operator = operator
      @conditions = conditions
      @additional_properties = additional_properties
      @_field_set = { "operator": operator, "conditions": conditions }
    end

    # Deserialize a JSON object to an instance of GroupCondition
    #
    # @param json_object [String]
    # @return [Vapi::GroupCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      operator = parsed_json["operator"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::GroupConditionConditionsItem.from_json(json_object: item)
      end
      new(
        operator: operator,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of GroupCondition to a JSON object
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
      obj.operator.is_a?(Vapi::GroupConditionOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.conditions.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
