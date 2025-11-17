# frozen_string_literal: true

require_relative "filter_structured_output_column_on_call_table_column"
require_relative "filter_structured_output_column_on_call_table_operator"
require "ostruct"
require "json"

module Vapi
  class FilterStructuredOutputColumnOnCallTable
    # @return [Vapi::FilterStructuredOutputColumnOnCallTableColumn] This is the column in the call table that will be filtered on.
    #  Structured Output Type columns are only to filter on
    #  artifact.structuredOutputs[OutputID] column.
    attr_reader :column
    # @return [Vapi::FilterStructuredOutputColumnOnCallTableOperator] This is the operator to use for the filter.
    #  The operator depends on the value type of the structured output.
    #  If the structured output is a string or boolean, the operator must be "=", "!="
    #  If the structured output is a number, the operator must be "=", ">", "<", ">=",
    #  "<="
    #  If the structured output is an array, the operator must be "in" or "not_in"
    attr_reader :operator
    # @return [Hash{String => Object}] This is the value to filter on.
    #  The value type depends on the structured output type being filtered.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param column [Vapi::FilterStructuredOutputColumnOnCallTableColumn] This is the column in the call table that will be filtered on.
    #  Structured Output Type columns are only to filter on
    #  artifact.structuredOutputs[OutputID] column.
    # @param operator [Vapi::FilterStructuredOutputColumnOnCallTableOperator] This is the operator to use for the filter.
    #  The operator depends on the value type of the structured output.
    #  If the structured output is a string or boolean, the operator must be "=", "!="
    #  If the structured output is a number, the operator must be "=", ">", "<", ">=",
    #  "<="
    #  If the structured output is an array, the operator must be "in" or "not_in"
    # @param value [Hash{String => Object}] This is the value to filter on.
    #  The value type depends on the structured output type being filtered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FilterStructuredOutputColumnOnCallTable]
    def initialize(column:, operator:, value:, additional_properties: nil)
      @column = column
      @operator = operator
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "column": column, "operator": operator, "value": value }
    end

    # Deserialize a JSON object to an instance of
    #  FilterStructuredOutputColumnOnCallTable
    #
    # @param json_object [String]
    # @return [Vapi::FilterStructuredOutputColumnOnCallTable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      column = parsed_json["column"]
      operator = parsed_json["operator"]
      value = parsed_json["value"]
      new(
        column: column,
        operator: operator,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of FilterStructuredOutputColumnOnCallTable to a JSON
    #  object
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
      obj.column.is_a?(Vapi::FilterStructuredOutputColumnOnCallTableColumn) != false || raise("Passed value for field obj.column is not the expected type, validation failed.")
      obj.operator.is_a?(Vapi::FilterStructuredOutputColumnOnCallTableOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.value.is_a?(Hash) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
