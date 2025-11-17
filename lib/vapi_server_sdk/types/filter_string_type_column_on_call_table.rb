# frozen_string_literal: true

require_relative "filter_string_type_column_on_call_table_column"
require_relative "filter_string_type_column_on_call_table_operator"
require "ostruct"
require "json"

module Vapi
  class FilterStringTypeColumnOnCallTable
    # @return [Vapi::FilterStringTypeColumnOnCallTableColumn] This is the column in the call table that will be filtered on.
    #  String Type columns are columns where the rows store data as a string.
    #  Must be a valid column for the selected table.
    attr_reader :column
    # @return [Vapi::FilterStringTypeColumnOnCallTableOperator] This is the operator to use for the filter.
    #  For string type columns, the operator must be "=", "!=", "contains", "not
    #  contains"
    attr_reader :operator
    # @return [String] This is the value to filter on.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param column [Vapi::FilterStringTypeColumnOnCallTableColumn] This is the column in the call table that will be filtered on.
    #  String Type columns are columns where the rows store data as a string.
    #  Must be a valid column for the selected table.
    # @param operator [Vapi::FilterStringTypeColumnOnCallTableOperator] This is the operator to use for the filter.
    #  For string type columns, the operator must be "=", "!=", "contains", "not
    #  contains"
    # @param value [String] This is the value to filter on.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FilterStringTypeColumnOnCallTable]
    def initialize(column:, operator:, value:, additional_properties: nil)
      @column = column
      @operator = operator
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "column": column, "operator": operator, "value": value }
    end

    # Deserialize a JSON object to an instance of FilterStringTypeColumnOnCallTable
    #
    # @param json_object [String]
    # @return [Vapi::FilterStringTypeColumnOnCallTable]
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

    # Serialize an instance of FilterStringTypeColumnOnCallTable to a JSON object
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
      obj.column.is_a?(Vapi::FilterStringTypeColumnOnCallTableColumn) != false || raise("Passed value for field obj.column is not the expected type, validation failed.")
      obj.operator.is_a?(Vapi::FilterStringTypeColumnOnCallTableOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
