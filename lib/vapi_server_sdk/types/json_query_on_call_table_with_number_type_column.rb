# frozen_string_literal: true

require_relative "json_query_on_call_table_with_number_type_column_type"
require_relative "json_query_on_call_table_with_number_type_column_table"
require_relative "json_query_on_call_table_with_number_type_column_filters_item"
require_relative "json_query_on_call_table_with_number_type_column_column"
require_relative "json_query_on_call_table_with_number_type_column_operation"
require "ostruct"
require "json"

module Vapi
  class JsonQueryOnCallTableWithNumberTypeColumn
    # @return [Vapi::JsonQueryOnCallTableWithNumberTypeColumnType] This is the type of query. Only allowed type is "vapiql-json".
    attr_reader :type
    # @return [Vapi::JsonQueryOnCallTableWithNumberTypeColumnTable] This is the table that will be queried.
    attr_reader :table
    # @return [Array<Vapi::JsonQueryOnCallTableWithNumberTypeColumnFiltersItem>] This is the filters to apply to the insight.
    #  The discriminator automatically selects the correct filter type based on column
    #  and operator.
    attr_reader :filters
    # @return [Vapi::JsonQueryOnCallTableWithNumberTypeColumnColumn] This is the column that will be queried in the selected table.
    #  Available columns depend on the selected table.
    #  Number Type columns are columns where the rows store Number data
    attr_reader :column
    # @return [Vapi::JsonQueryOnCallTableWithNumberTypeColumnOperation] This is the aggregation operation to perform on the column.
    #  When the column is a number type, the operation must be one of the following:
    #  - average
    #  - sum
    #  - min
    #  - max
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

    # @param type [Vapi::JsonQueryOnCallTableWithNumberTypeColumnType] This is the type of query. Only allowed type is "vapiql-json".
    # @param table [Vapi::JsonQueryOnCallTableWithNumberTypeColumnTable] This is the table that will be queried.
    # @param filters [Array<Vapi::JsonQueryOnCallTableWithNumberTypeColumnFiltersItem>] This is the filters to apply to the insight.
    #  The discriminator automatically selects the correct filter type based on column
    #  and operator.
    # @param column [Vapi::JsonQueryOnCallTableWithNumberTypeColumnColumn] This is the column that will be queried in the selected table.
    #  Available columns depend on the selected table.
    #  Number Type columns are columns where the rows store Number data
    # @param operation [Vapi::JsonQueryOnCallTableWithNumberTypeColumnOperation] This is the aggregation operation to perform on the column.
    #  When the column is a number type, the operation must be one of the following:
    #  - average
    #  - sum
    #  - min
    #  - max
    # @param name [String] This is the name of the query.
    #  It will be used to label the query in the insight board on the UI.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::JsonQueryOnCallTableWithNumberTypeColumn]
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
    #  JsonQueryOnCallTableWithNumberTypeColumn
    #
    # @param json_object [String]
    # @return [Vapi::JsonQueryOnCallTableWithNumberTypeColumn]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      table = parsed_json["table"]
      filters = parsed_json["filters"]&.map do |item|
        item = item.to_json
        Vapi::JsonQueryOnCallTableWithNumberTypeColumnFiltersItem.from_json(json_object: item)
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

    # Serialize an instance of JsonQueryOnCallTableWithNumberTypeColumn to a JSON
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
      obj.type.is_a?(Vapi::JsonQueryOnCallTableWithNumberTypeColumnType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.table.is_a?(Vapi::JsonQueryOnCallTableWithNumberTypeColumnTable) != false || raise("Passed value for field obj.table is not the expected type, validation failed.")
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      obj.column.is_a?(Vapi::JsonQueryOnCallTableWithNumberTypeColumnColumn) != false || raise("Passed value for field obj.column is not the expected type, validation failed.")
      obj.operation.is_a?(Vapi::JsonQueryOnCallTableWithNumberTypeColumnOperation) != false || raise("Passed value for field obj.operation is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
