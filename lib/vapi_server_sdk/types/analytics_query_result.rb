# frozen_string_literal: true
require_relative "time_range"
require "ostruct"
require "json"

module Vapi
  class AnalyticsQueryResult
  # @return [String] This is the unique key for the query.
    attr_reader :name
  # @return [Vapi::TimeRange] This is the time range for the query.
    attr_reader :time_range
  # @return [Array<Hash{String => Object}>] This is the result of the query, a list of unique groups with result of their
#  aggregations.
#  Example:
#  "result": [
#  { "date": "2023-01-01", "assistantId": "123", "endedReason":
#  "customer-ended-call", "sumDuration": 120, "avgCost": 10.5 },
#  { "date": "2023-01-02", "assistantId": "123", "endedReason":
#  "customer-did-not-give-microphone-permission", "sumDuration": 0, "avgCost": 0 },
#  // Additional results
#  ]
    attr_reader :result
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the unique key for the query.
    # @param time_range [Vapi::TimeRange] This is the time range for the query.
    # @param result [Array<Hash{String => Object}>] This is the result of the query, a list of unique groups with result of their
#  aggregations.
#  Example:
#  "result": [
#  { "date": "2023-01-01", "assistantId": "123", "endedReason":
#  "customer-ended-call", "sumDuration": 120, "avgCost": 10.5 },
#  { "date": "2023-01-02", "assistantId": "123", "endedReason":
#  "customer-did-not-give-microphone-permission", "sumDuration": 0, "avgCost": 0 },
#  // Additional results
#  ]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalyticsQueryResult]
    def initialize(name:, time_range:, result:, additional_properties: nil)
      @name = name
      @time_range = time_range
      @result = result
      @additional_properties = additional_properties
      @_field_set = { "name": name, "timeRange": time_range, "result": result }
    end
# Deserialize a JSON object to an instance of AnalyticsQueryResult
    #
    # @param json_object [String] 
    # @return [Vapi::AnalyticsQueryResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["timeRange"].nil?
        time_range = parsed_json["timeRange"].to_json
        time_range = Vapi::TimeRange.from_json(json_object: time_range)
      else
        time_range = nil
      end
      result = parsed_json["result"]
      new(
        name: name,
        time_range: time_range,
        result: result,
        additional_properties: struct
      )
    end
# Serialize an instance of AnalyticsQueryResult to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Vapi::TimeRange.validate_raw(obj: obj.time_range)
      obj.result.is_a?(Array) != false || raise("Passed value for field obj.result is not the expected type, validation failed.")
    end
  end
end