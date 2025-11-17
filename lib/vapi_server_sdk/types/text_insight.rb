# frozen_string_literal: true

require_relative "insight_time_range"
require_relative "text_insight_queries_item"
require "date"
require "ostruct"
require "json"

module Vapi
  class TextInsight
    # @return [String] This is the name of the Insight.
    attr_reader :name
    # @return [Hash{String => Object}] Formulas are mathematical expressions applied on the data returned by the
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
    attr_reader :formula
    # @return [Vapi::InsightTimeRange]
    attr_reader :time_range
    # @return [Array<Vapi::TextInsightQueriesItem>] These are the queries to run to generate the insight.
    #  For Text Insights, we only allow a single query, or require a formula if
    #  multiple queries are provided
    attr_reader :queries
    # @return [String] This is the unique identifier for the Insight.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this Insight belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the Insight was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the Insight was last updated.
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the Insight.
    # @param formula [Hash{String => Object}] Formulas are mathematical expressions applied on the data returned by the
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
    # @param queries [Array<Vapi::TextInsightQueriesItem>] These are the queries to run to generate the insight.
    #  For Text Insights, we only allow a single query, or require a formula if
    #  multiple queries are provided
    # @param id [String] This is the unique identifier for the Insight.
    # @param org_id [String] This is the unique identifier for the org that this Insight belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the Insight was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the Insight was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TextInsight]
    def initialize(queries:, id:, org_id:, created_at:, updated_at:, name: OMIT, formula: OMIT, time_range: OMIT,
                   additional_properties: nil)
      @name = name if name != OMIT
      @formula = formula if formula != OMIT
      @time_range = time_range if time_range != OMIT
      @queries = queries
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "formula": formula,
        "timeRange": time_range,
        "queries": queries,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TextInsight
    #
    # @param json_object [String]
    # @return [Vapi::TextInsight]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      formula = parsed_json["formula"]
      if parsed_json["timeRange"].nil?
        time_range = nil
      else
        time_range = parsed_json["timeRange"].to_json
        time_range = Vapi::InsightTimeRange.from_json(json_object: time_range)
      end
      queries = parsed_json["queries"]&.map do |item|
        item = item.to_json
        Vapi::TextInsightQueriesItem.from_json(json_object: item)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        name: name,
        formula: formula,
        time_range: time_range,
        queries: queries,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of TextInsight to a JSON object
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
      obj.formula&.is_a?(Hash) != false || raise("Passed value for field obj.formula is not the expected type, validation failed.")
      obj.time_range.nil? || Vapi::InsightTimeRange.validate_raw(obj: obj.time_range)
      obj.queries.is_a?(Array) != false || raise("Passed value for field obj.queries is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
