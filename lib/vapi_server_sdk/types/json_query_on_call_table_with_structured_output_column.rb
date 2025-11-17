# frozen_string_literal: true

require_relative "json_query_on_call_table_with_structured_output_column_type"
require_relative "json_query_on_call_table_with_structured_output_column_table"
require_relative "json_query_on_call_table_with_structured_output_column_filters_item"
require_relative "json_query_on_call_table_with_structured_output_column_column"
require_relative "json_query_on_call_table_with_structured_output_column_operation"
require "ostruct"
require "json"

module Vapi
  class JsonQueryOnCallTableWithStructuredOutputColumn
    # @return [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnType] This is the type of query. Only allowed type is "vapiql-json".
    attr_reader :type
    # @return [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnTable] This is the table that will be queried.
    attr_reader :table
    # @return [Array<Vapi::JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem>] This is the filters to apply to the insight.
    #  The discriminator automatically selects the correct filter type based on column
    #  and operator.
    attr_reader :filters
    # @return [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnColumn] This is the column that will be queried in the call table.
    #  Structured Output Type columns are only to query on
    #  artifact.structuredOutputs[OutputID] column.
    attr_reader :column
    # @return [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnOperation] This is the aggregation operation to perform on the column.
    #  When the column is a structured output type, the operation depends on the value
    #  of the structured output.
    #  If the structured output is a string or boolean, the operation must be "count".
    #  If the structured output is a number, the operation can be "average", "sum",
    #  "min", or "max".
    attr_reader :operation
    # @return [String] This is the name of the query.
    #  It will be used to label the query in the insight board on the UI.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnType] This is the type of query. Only allowed type is "vapiql-json".
    # @param table [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnTable] This is the table that will be queried.
    # @param filters [Array<Vapi::JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem>] This is the filters to apply to the insight.
    #  The discriminator automatically selects the correct filter type based on column
    #  and operator.
    # @param column [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnColumn] This is the column that will be queried in the call table.
    #  Structured Output Type columns are only to query on
    #  artifact.structuredOutputs[OutputID] column.
    # @param operation [Vapi::JsonQueryOnCallTableWithStructuredOutputColumnOperation] This is the aggregation operation to perform on the column.
    #  When the column is a structured output type, the operation depends on the value
    #  of the structured output.
    #  If the structured output is a string or boolean, the operation must be "count".
    #  If the structured output is a number, the operation can be "average", "sum",
    #  "min", or "max".
    # @param name [String] This is the name of the query.
    #  It will be used to label the query in the insight board on the UI.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::JsonQueryOnCallTableWithStructuredOutputColumn]
    def initialize(type:, table:, column:, operation:, filters: OMIT, name: OMIT, additional_properties: nil)
      @type = type
      @table = table
      @filters = filters if filters != OMIT
      @column = column
      @operation = operation
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "table": table,
        "filters": filters,
        "column": column,
        "operation": operation,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  JsonQueryOnCallTableWithStructuredOutputColumn
    #
    # @param json_object [String]
    # @return [Vapi::JsonQueryOnCallTableWithStructuredOutputColumn]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      table = parsed_json["table"]
      filters = parsed_json["filters"]&.map do |item|
        item = item.to_json
        Vapi::JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem.from_json(json_object: item)
      end
      column = parsed_json["column"]
      operation = parsed_json["operation"]
      name = parsed_json["name"]
      new(
        type: type,
        table: table,
        filters: filters,
        column: column,
        operation: operation,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of JsonQueryOnCallTableWithStructuredOutputColumn to a
    #  JSON object
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
      obj.type.is_a?(Vapi::JsonQueryOnCallTableWithStructuredOutputColumnType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.table.is_a?(Vapi::JsonQueryOnCallTableWithStructuredOutputColumnTable) != false || raise("Passed value for field obj.table is not the expected type, validation failed.")
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      obj.column.is_a?(Vapi::JsonQueryOnCallTableWithStructuredOutputColumnColumn) != false || raise("Passed value for field obj.column is not the expected type, validation failed.")
      obj.operation.is_a?(Vapi::JsonQueryOnCallTableWithStructuredOutputColumnOperation) != false || raise("Passed value for field obj.operation is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
