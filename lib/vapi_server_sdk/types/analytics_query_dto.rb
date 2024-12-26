# frozen_string_literal: true

require_relative "analytics_query"
require "ostruct"
require "json"

module Vapi
  class AnalyticsQueryDto
    # @return [Array<Vapi::AnalyticsQuery>] This is the list of metric queries you want to perform.
    attr_reader :queries
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param queries [Array<Vapi::AnalyticsQuery>] This is the list of metric queries you want to perform.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalyticsQueryDto]
    def initialize(queries:, additional_properties: nil)
      @queries = queries
      @additional_properties = additional_properties
      @_field_set = { "queries": queries }
    end

    # Deserialize a JSON object to an instance of AnalyticsQueryDto
    #
    # @param json_object [String]
    # @return [Vapi::AnalyticsQueryDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      queries = parsed_json["queries"]&.map do |item|
        item = item.to_json
        Vapi::AnalyticsQuery.from_json(json_object: item)
      end
      new(queries: queries, additional_properties: struct)
    end

    # Serialize an instance of AnalyticsQueryDto to a JSON object
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
      obj.queries.is_a?(Array) != false || raise("Passed value for field obj.queries is not the expected type, validation failed.")
    end
  end
end
