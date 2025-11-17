# frozen_string_literal: true

require_relative "insight_time_range_with_step_step"
require "ostruct"
require "json"

module Vapi
  class InsightTimeRangeWithStep
    # @return [Vapi::InsightTimeRangeWithStepStep] This is the group by step for aggregation.
    #  If not provided, defaults to group by day.
    attr_reader :step
    # @return [Hash{String => Object}] This is the start date for the time range.
    #  Should be a valid ISO 8601 date-time string or relative time string.
    #  If not provided, defaults to the 7 days ago.
    #  Relative time strings of the format "-{number}{unit}" are allowed.
    #  Valid units are:
    #  - d: days
    #  - h: hours
    #  - w: weeks
    #  - m: months
    #  - y: years
    attr_reader :start
    # @return [Hash{String => Object}] This is the end date for the time range.
    #  Should be a valid ISO 8601 date-time string or relative time string.
    #  If not provided, defaults to now.
    #  Relative time strings of the format "-{number}{unit}" are allowed.
    #  Valid units are:
    #  - d: days
    #  - h: hours
    #  - w: weeks
    #  - m: months
    #  - y: years
    attr_reader :end_
    # @return [String] This is the timezone you want to set for the query.
    #  If not provided, defaults to UTC.
    attr_reader :timezone
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param step [Vapi::InsightTimeRangeWithStepStep] This is the group by step for aggregation.
    #  If not provided, defaults to group by day.
    # @param start [Hash{String => Object}] This is the start date for the time range.
    #  Should be a valid ISO 8601 date-time string or relative time string.
    #  If not provided, defaults to the 7 days ago.
    #  Relative time strings of the format "-{number}{unit}" are allowed.
    #  Valid units are:
    #  - d: days
    #  - h: hours
    #  - w: weeks
    #  - m: months
    #  - y: years
    # @param end_ [Hash{String => Object}] This is the end date for the time range.
    #  Should be a valid ISO 8601 date-time string or relative time string.
    #  If not provided, defaults to now.
    #  Relative time strings of the format "-{number}{unit}" are allowed.
    #  Valid units are:
    #  - d: days
    #  - h: hours
    #  - w: weeks
    #  - m: months
    #  - y: years
    # @param timezone [String] This is the timezone you want to set for the query.
    #  If not provided, defaults to UTC.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InsightTimeRangeWithStep]
    def initialize(step: OMIT, start: OMIT, end_: OMIT, timezone: OMIT, additional_properties: nil)
      @step = step if step != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @timezone = timezone if timezone != OMIT
      @additional_properties = additional_properties
      @_field_set = { "step": step, "start": start, "end": end_, "timezone": timezone }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InsightTimeRangeWithStep
    #
    # @param json_object [String]
    # @return [Vapi::InsightTimeRangeWithStep]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      step = parsed_json["step"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      timezone = parsed_json["timezone"]
      new(
        step: step,
        start: start,
        end_: end_,
        timezone: timezone,
        additional_properties: struct
      )
    end

    # Serialize an instance of InsightTimeRangeWithStep to a JSON object
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
      obj.step&.is_a?(Vapi::InsightTimeRangeWithStepStep) != false || raise("Passed value for field obj.step is not the expected type, validation failed.")
      obj.start&.is_a?(Hash) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(Hash) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
    end
  end
end
