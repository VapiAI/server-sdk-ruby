# frozen_string_literal: true

require_relative "time_range_step"
require "date"
require "ostruct"
require "json"

module Vapi
  class TimeRange
    # @return [Vapi::TimeRangeStep] This is the time step for aggregations.
    #  If not provided, defaults to returning for the entire time range.
    attr_reader :step
    # @return [DateTime] This is the start date for the time range.
    #  If not provided, defaults to the 7 days ago.
    attr_reader :start
    # @return [DateTime] This is the end date for the time range.
    #  If not provided, defaults to now.
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

    # @param step [Vapi::TimeRangeStep] This is the time step for aggregations.
    #  If not provided, defaults to returning for the entire time range.
    # @param start [DateTime] This is the start date for the time range.
    #  If not provided, defaults to the 7 days ago.
    # @param end_ [DateTime] This is the end date for the time range.
    #  If not provided, defaults to now.
    # @param timezone [String] This is the timezone you want to set for the query.
    #  If not provided, defaults to UTC.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TimeRange]
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

    # Deserialize a JSON object to an instance of TimeRange
    #
    # @param json_object [String]
    # @return [Vapi::TimeRange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      step = parsed_json["step"]
      start = (DateTime.parse(parsed_json["start"]) unless parsed_json["start"].nil?)
      end_ = (DateTime.parse(parsed_json["end"]) unless parsed_json["end"].nil?)
      timezone = parsed_json["timezone"]
      new(
        step: step,
        start: start,
        end_: end_,
        timezone: timezone,
        additional_properties: struct
      )
    end

    # Serialize an instance of TimeRange to a JSON object
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
      obj.step&.is_a?(Vapi::TimeRangeStep) != false || raise("Passed value for field obj.step is not the expected type, validation failed.")
      obj.start&.is_a?(DateTime) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(DateTime) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
    end
  end
end
