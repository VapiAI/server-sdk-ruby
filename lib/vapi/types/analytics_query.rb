# frozen_string_literal: true

require_relative "analytics_query_group_by_item"
require_relative "time_range"
require_relative "analytics_operation"
require "ostruct"
require "json"

module Vapi
  class AnalyticsQuery
    # @return [String] This is the table you want to query.
    attr_reader :table
    # @return [Array<Vapi::AnalyticsQueryGroupByItem>] This is the list of columns you want to group by.
    attr_reader :group_by
    # @return [String] This is the name of the query. This will be used to identify the query in the
    #  response.
    attr_reader :name
    # @return [Vapi::TimeRange] This is the time range for the query.
    attr_reader :time_range
    # @return [Array<Vapi::AnalyticsOperation>] This is the list of operations you want to perform.
    attr_reader :operations
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param table [String] This is the table you want to query.
    # @param group_by [Array<Vapi::AnalyticsQueryGroupByItem>] This is the list of columns you want to group by.
    # @param name [String] This is the name of the query. This will be used to identify the query in the
    #  response.
    # @param time_range [Vapi::TimeRange] This is the time range for the query.
    # @param operations [Array<Vapi::AnalyticsOperation>] This is the list of operations you want to perform.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalyticsQuery]
    def initialize(table:, name:, operations:, group_by: OMIT, time_range: OMIT, additional_properties: nil)
      @table = table
      @group_by = group_by if group_by != OMIT
      @name = name
      @time_range = time_range if time_range != OMIT
      @operations = operations
      @additional_properties = additional_properties
      @_field_set = {
        "table": table,
        "groupBy": group_by,
        "name": name,
        "timeRange": time_range,
        "operations": operations
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AnalyticsQuery
    #
    # @param json_object [String]
    # @return [Vapi::AnalyticsQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      table = parsed_json["table"]
      group_by = parsed_json["groupBy"]
      name = parsed_json["name"]
      if parsed_json["timeRange"].nil?
        time_range = nil
      else
        time_range = parsed_json["timeRange"].to_json
        time_range = Vapi::TimeRange.from_json(json_object: time_range)
      end
      operations = parsed_json["operations"]&.map do |item|
        item = item.to_json
        Vapi::AnalyticsOperation.from_json(json_object: item)
      end
      new(
        table: table,
        group_by: group_by,
        name: name,
        time_range: time_range,
        operations: operations,
        additional_properties: struct
      )
    end

    # Serialize an instance of AnalyticsQuery to a JSON object
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
      obj.table.is_a?(String) != false || raise("Passed value for field obj.table is not the expected type, validation failed.")
      obj.group_by&.is_a?(Array) != false || raise("Passed value for field obj.group_by is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.time_range.nil? || Vapi::TimeRange.validate_raw(obj: obj.time_range)
      obj.operations.is_a?(Array) != false || raise("Passed value for field obj.operations is not the expected type, validation failed.")
    end
  end
end
