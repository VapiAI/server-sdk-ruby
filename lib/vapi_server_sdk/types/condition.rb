# frozen_string_literal: true

require_relative "condition_operator"
require "ostruct"
require "json"

module Vapi
  class Condition
    # @return [Vapi::ConditionOperator] This is the operator you want to use to compare the parameter and value.
    attr_reader :operator
    # @return [String] This is the name of the parameter that you want to check.
    attr_reader :param
    # @return [Hash{String => Object}] This is the value you want to compare against the parameter.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param operator [Vapi::ConditionOperator] This is the operator you want to use to compare the parameter and value.
    # @param param [String] This is the name of the parameter that you want to check.
    # @param value [Hash{String => Object}] This is the value you want to compare against the parameter.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Condition]
    def initialize(operator:, param:, value:, additional_properties: nil)
      @operator = operator
      @param = param
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "operator": operator, "param": param, "value": value }
    end

    # Deserialize a JSON object to an instance of Condition
    #
    # @param json_object [String]
    # @return [Vapi::Condition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      operator = parsed_json["operator"]
      param = parsed_json["param"]
      value = parsed_json["value"]
      new(
        operator: operator,
        param: param,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of Condition to a JSON object
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
      obj.operator.is_a?(Vapi::ConditionOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.param.is_a?(String) != false || raise("Passed value for field obj.param is not the expected type, validation failed.")
      obj.value.is_a?(Hash) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
