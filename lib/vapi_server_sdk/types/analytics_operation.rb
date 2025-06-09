# frozen_string_literal: true
require_relative "analytics_operation_operation"
require_relative "analytics_operation_column"
require "ostruct"
require "json"

module Vapi
  class AnalyticsOperation
  # @return [Vapi::AnalyticsOperationOperation] This is the aggregation operation you want to perform.
    attr_reader :operation
  # @return [Vapi::AnalyticsOperationColumn] This is the columns you want to perform the aggregation operation on.
    attr_reader :column
  # @return [String] This is the alias for column name returned. Defaults to `${operation}${column}`.
    attr_reader :alias_
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param operation [Vapi::AnalyticsOperationOperation] This is the aggregation operation you want to perform.
    # @param column [Vapi::AnalyticsOperationColumn] This is the columns you want to perform the aggregation operation on.
    # @param alias_ [String] This is the alias for column name returned. Defaults to `${operation}${column}`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalyticsOperation]
    def initialize(operation:, column:, alias_: OMIT, additional_properties: nil)
      @operation = operation
      @column = column
      @alias_ = alias_ if alias_ != OMIT
      @additional_properties = additional_properties
      @_field_set = { "operation": operation, "column": column, "alias": alias_ }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AnalyticsOperation
    #
    # @param json_object [String] 
    # @return [Vapi::AnalyticsOperation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      operation = parsed_json["operation"]
      column = parsed_json["column"]
      alias_ = parsed_json["alias"]
      new(
        operation: operation,
        column: column,
        alias_: alias_,
        additional_properties: struct
      )
    end
# Serialize an instance of AnalyticsOperation to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.operation.is_a?(Vapi::AnalyticsOperationOperation) != false || raise("Passed value for field obj.operation is not the expected type, validation failed.")
      obj.column.is_a?(Vapi::AnalyticsOperationColumn) != false || raise("Passed value for field obj.column is not the expected type, validation failed.")
      obj.alias_&.is_a?(String) != false || raise("Passed value for field obj.alias_ is not the expected type, validation failed.")
    end
  end
end