# frozen_string_literal: true

require_relative "insight_formula"
require_relative "line_insight_metadata"
require_relative "insight_time_range_with_step"
require_relative "line_insight_group_by"
require_relative "line_insight_queries_item"
require "date"
require "ostruct"
require "json"

module Vapi
  class LineInsight
    # @return [String] This is the name of the Insight.
    attr_reader :name
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
    # @return [Vapi::LineInsightMetadata] This is the metadata for the insight.
    attr_reader :metadata
    # @return [Vapi::InsightTimeRangeWithStep]
    attr_reader :time_range
    # @return [Vapi::LineInsightGroupBy] This is the group by column for the insight when table is `call`.
    #  These are the columns to group the results by.
    #  All results are grouped by the time range step by default.
    attr_reader :group_by
    # @return [Array<Vapi::LineInsightQueriesItem>] These are the queries to run to generate the insight.
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
    # @param metadata [Vapi::LineInsightMetadata] This is the metadata for the insight.
    # @param time_range [Vapi::InsightTimeRangeWithStep]
    # @param group_by [Vapi::LineInsightGroupBy] This is the group by column for the insight when table is `call`.
    #  These are the columns to group the results by.
    #  All results are grouped by the time range step by default.
    # @param queries [Array<Vapi::LineInsightQueriesItem>] These are the queries to run to generate the insight.
    # @param id [String] This is the unique identifier for the Insight.
    # @param org_id [String] This is the unique identifier for the org that this Insight belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the Insight was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the Insight was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::LineInsight]
    def initialize(queries:, id:, org_id:, created_at:, updated_at:, name: OMIT, formulas: OMIT, metadata: OMIT,
                   time_range: OMIT, group_by: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @formulas = formulas if formulas != OMIT
      @metadata = metadata if metadata != OMIT
      @time_range = time_range if time_range != OMIT
      @group_by = group_by if group_by != OMIT
      @queries = queries
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "formulas": formulas,
        "metadata": metadata,
        "timeRange": time_range,
        "groupBy": group_by,
        "queries": queries,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LineInsight
    #
    # @param json_object [String]
    # @return [Vapi::LineInsight]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      formulas = parsed_json["formulas"]&.map do |item|
        item = item.to_json
        Vapi::InsightFormula.from_json(json_object: item)
      end
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::LineInsightMetadata.from_json(json_object: metadata)
      end
      if parsed_json["timeRange"].nil?
        time_range = nil
      else
        time_range = parsed_json["timeRange"].to_json
        time_range = Vapi::InsightTimeRangeWithStep.from_json(json_object: time_range)
      end
      group_by = parsed_json["groupBy"]
      queries = parsed_json["queries"]&.map do |item|
        item = item.to_json
        Vapi::LineInsightQueriesItem.from_json(json_object: item)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        name: name,
        formulas: formulas,
        metadata: metadata,
        time_range: time_range,
        group_by: group_by,
        queries: queries,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of LineInsight to a JSON object
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
      obj.formulas&.is_a?(Array) != false || raise("Passed value for field obj.formulas is not the expected type, validation failed.")
      obj.metadata.nil? || Vapi::LineInsightMetadata.validate_raw(obj: obj.metadata)
      obj.time_range.nil? || Vapi::InsightTimeRangeWithStep.validate_raw(obj: obj.time_range)
      obj.group_by&.is_a?(Vapi::LineInsightGroupBy) != false || raise("Passed value for field obj.group_by is not the expected type, validation failed.")
      obj.queries.is_a?(Array) != false || raise("Passed value for field obj.queries is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
