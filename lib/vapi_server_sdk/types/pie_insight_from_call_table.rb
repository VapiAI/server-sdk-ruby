# frozen_string_literal: true

require_relative "pie_insight_from_call_table_type"
require_relative "insight_formula"
require_relative "insight_time_range"
require_relative "pie_insight_from_call_table_group_by"
require_relative "pie_insight_from_call_table_queries_item"
require "ostruct"
require "json"

module Vapi
  class PieInsightFromCallTable
    # @return [String] This is the name of the Insight.
    attr_reader :name
    # @return [Vapi::PieInsightFromCallTableType] This is the type of the Insight.
    #  It is required to be `pie` to create a pie insight.
    attr_reader :type
    # @return [Array<Vapi::InsightFormula>] Formulas are mathematical expressions applied on the data returned by the
    #  queries to transform them before being used to create the insight.
    #  The formulas needs to be a valid mathematical expression, supported by MathJS -
    #  https://mathjs.org/docs/expressions/syntax.html
    #  A formula is created by using the query names as the variable.
    #  The formulas must contain at least one query name in the LiquidJS format
    #  {{query_name}} or {{['query name']}} which will be substituted with the query
    #  result.
    #  For example, if you have 2 queries, 'Was Booking Made' and 'Average Call
    #  Duration', you can create a formula like this:
    #  ```
    #  {{['Query 1']}} / {{['Query 2']}} * 100
    #  ```
    #  ```
    #  ({{[Query 1]}} * 10) + {{[Query 2]}}
    #  ```
    #  This will take the
    #  You can also use the query names as the variable in the formula.
    attr_reader :formulas
    # @return [Vapi::InsightTimeRange]
    attr_reader :time_range
    # @return [Vapi::PieInsightFromCallTableGroupBy] This is the group by column for the insight when table is `call`.
    #  These are the columns to group the results by.
    #  All results are grouped by the time range step by default.
    attr_reader :group_by
    # @return [Array<Vapi::PieInsightFromCallTableQueriesItem>] These are the queries to run to generate the insight.
    attr_reader :queries
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the Insight.
    # @param type [Vapi::PieInsightFromCallTableType] This is the type of the Insight.
    #  It is required to be `pie` to create a pie insight.
    # @param formulas [Array<Vapi::InsightFormula>] Formulas are mathematical expressions applied on the data returned by the
    #  queries to transform them before being used to create the insight.
    #  The formulas needs to be a valid mathematical expression, supported by MathJS -
    #  https://mathjs.org/docs/expressions/syntax.html
    #  A formula is created by using the query names as the variable.
    #  The formulas must contain at least one query name in the LiquidJS format
    #  {{query_name}} or {{['query name']}} which will be substituted with the query
    #  result.
    #  For example, if you have 2 queries, 'Was Booking Made' and 'Average Call
    #  Duration', you can create a formula like this:
    #  ```
    #  {{['Query 1']}} / {{['Query 2']}} * 100
    #  ```
    #  ```
    #  ({{[Query 1]}} * 10) + {{[Query 2]}}
    #  ```
    #  This will take the
    #  You can also use the query names as the variable in the formula.
    # @param time_range [Vapi::InsightTimeRange]
    # @param group_by [Vapi::PieInsightFromCallTableGroupBy] This is the group by column for the insight when table is `call`.
    #  These are the columns to group the results by.
    #  All results are grouped by the time range step by default.
    # @param queries [Array<Vapi::PieInsightFromCallTableQueriesItem>] These are the queries to run to generate the insight.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PieInsightFromCallTable]
    def initialize(type:, queries:, name: OMIT, formulas: OMIT, time_range: OMIT, group_by: OMIT,
                   additional_properties: nil)
      @name = name if name != OMIT
      @type = type
      @formulas = formulas if formulas != OMIT
      @time_range = time_range if time_range != OMIT
      @group_by = group_by if group_by != OMIT
      @queries = queries
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "type": type,
        "formulas": formulas,
        "timeRange": time_range,
        "groupBy": group_by,
        "queries": queries
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PieInsightFromCallTable
    #
    # @param json_object [String]
    # @return [Vapi::PieInsightFromCallTable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      type = parsed_json["type"]
      formulas = parsed_json["formulas"]&.map do |item|
        item = item.to_json
        Vapi::InsightFormula.from_json(json_object: item)
      end
      if parsed_json["timeRange"].nil?
        time_range = nil
      else
        time_range = parsed_json["timeRange"].to_json
        time_range = Vapi::InsightTimeRange.from_json(json_object: time_range)
      end
      group_by = parsed_json["groupBy"]
      queries = parsed_json["queries"]&.map do |item|
        item = item.to_json
        Vapi::PieInsightFromCallTableQueriesItem.from_json(json_object: item)
      end
      new(
        name: name,
        type: type,
        formulas: formulas,
        time_range: time_range,
        group_by: group_by,
        queries: queries,
        additional_properties: struct
      )
    end

    # Serialize an instance of PieInsightFromCallTable to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::PieInsightFromCallTableType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.formulas&.is_a?(Array) != false || raise("Passed value for field obj.formulas is not the expected type, validation failed.")
      obj.time_range.nil? || Vapi::InsightTimeRange.validate_raw(obj: obj.time_range)
      obj.group_by&.is_a?(Vapi::PieInsightFromCallTableGroupBy) != false || raise("Passed value for field obj.group_by is not the expected type, validation failed.")
      obj.queries.is_a?(Array) != false || raise("Passed value for field obj.queries is not the expected type, validation failed.")
    end
  end
end
