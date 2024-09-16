# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Metrics
    # @return [String]
    attr_reader :org_id
    # @return [String]
    attr_reader :range_start
    # @return [String]
    attr_reader :range_end
    # @return [Float]
    attr_reader :bill
    # @return [Boolean]
    attr_reader :bill_within_billing_limit
    # @return [Hash{String => Object}]
    attr_reader :bill_daily_breakdown
    # @return [Float]
    attr_reader :call_active
    # @return [Boolean]
    attr_reader :call_active_within_concurrency_limit
    # @return [Float]
    attr_reader :call_minutes
    # @return [Hash{String => Object}]
    attr_reader :call_minutes_daily_breakdown
    # @return [Float]
    attr_reader :call_minutes_average
    # @return [Hash{String => Object}]
    attr_reader :call_minutes_average_daily_breakdown
    # @return [Float]
    attr_reader :call_count
    # @return [Hash{String => Object}]
    attr_reader :call_count_daily_breakdown
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param org_id [String]
    # @param range_start [String]
    # @param range_end [String]
    # @param bill [Float]
    # @param bill_within_billing_limit [Boolean]
    # @param bill_daily_breakdown [Hash{String => Object}]
    # @param call_active [Float]
    # @param call_active_within_concurrency_limit [Boolean]
    # @param call_minutes [Float]
    # @param call_minutes_daily_breakdown [Hash{String => Object}]
    # @param call_minutes_average [Float]
    # @param call_minutes_average_daily_breakdown [Hash{String => Object}]
    # @param call_count [Float]
    # @param call_count_daily_breakdown [Hash{String => Object}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Metrics]
    def initialize(org_id:, range_start:, range_end:, bill:, bill_within_billing_limit:, bill_daily_breakdown:,
                   call_active:, call_active_within_concurrency_limit:, call_minutes:, call_minutes_daily_breakdown:, call_minutes_average:, call_minutes_average_daily_breakdown:, call_count:, call_count_daily_breakdown:, additional_properties: nil)
      @org_id = org_id
      @range_start = range_start
      @range_end = range_end
      @bill = bill
      @bill_within_billing_limit = bill_within_billing_limit
      @bill_daily_breakdown = bill_daily_breakdown
      @call_active = call_active
      @call_active_within_concurrency_limit = call_active_within_concurrency_limit
      @call_minutes = call_minutes
      @call_minutes_daily_breakdown = call_minutes_daily_breakdown
      @call_minutes_average = call_minutes_average
      @call_minutes_average_daily_breakdown = call_minutes_average_daily_breakdown
      @call_count = call_count
      @call_count_daily_breakdown = call_count_daily_breakdown
      @additional_properties = additional_properties
      @_field_set = {
        "orgId": org_id,
        "rangeStart": range_start,
        "rangeEnd": range_end,
        "bill": bill,
        "billWithinBillingLimit": bill_within_billing_limit,
        "billDailyBreakdown": bill_daily_breakdown,
        "callActive": call_active,
        "callActiveWithinConcurrencyLimit": call_active_within_concurrency_limit,
        "callMinutes": call_minutes,
        "callMinutesDailyBreakdown": call_minutes_daily_breakdown,
        "callMinutesAverage": call_minutes_average,
        "callMinutesAverageDailyBreakdown": call_minutes_average_daily_breakdown,
        "callCount": call_count,
        "callCountDailyBreakdown": call_count_daily_breakdown
      }
    end

    # Deserialize a JSON object to an instance of Metrics
    #
    # @param json_object [String]
    # @return [Vapi::Metrics]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      org_id = parsed_json["orgId"]
      range_start = parsed_json["rangeStart"]
      range_end = parsed_json["rangeEnd"]
      bill = parsed_json["bill"]
      bill_within_billing_limit = parsed_json["billWithinBillingLimit"]
      bill_daily_breakdown = parsed_json["billDailyBreakdown"]
      call_active = parsed_json["callActive"]
      call_active_within_concurrency_limit = parsed_json["callActiveWithinConcurrencyLimit"]
      call_minutes = parsed_json["callMinutes"]
      call_minutes_daily_breakdown = parsed_json["callMinutesDailyBreakdown"]
      call_minutes_average = parsed_json["callMinutesAverage"]
      call_minutes_average_daily_breakdown = parsed_json["callMinutesAverageDailyBreakdown"]
      call_count = parsed_json["callCount"]
      call_count_daily_breakdown = parsed_json["callCountDailyBreakdown"]
      new(
        org_id: org_id,
        range_start: range_start,
        range_end: range_end,
        bill: bill,
        bill_within_billing_limit: bill_within_billing_limit,
        bill_daily_breakdown: bill_daily_breakdown,
        call_active: call_active,
        call_active_within_concurrency_limit: call_active_within_concurrency_limit,
        call_minutes: call_minutes,
        call_minutes_daily_breakdown: call_minutes_daily_breakdown,
        call_minutes_average: call_minutes_average,
        call_minutes_average_daily_breakdown: call_minutes_average_daily_breakdown,
        call_count: call_count,
        call_count_daily_breakdown: call_count_daily_breakdown,
        additional_properties: struct
      )
    end

    # Serialize an instance of Metrics to a JSON object
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
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.range_start.is_a?(String) != false || raise("Passed value for field obj.range_start is not the expected type, validation failed.")
      obj.range_end.is_a?(String) != false || raise("Passed value for field obj.range_end is not the expected type, validation failed.")
      obj.bill.is_a?(Float) != false || raise("Passed value for field obj.bill is not the expected type, validation failed.")
      obj.bill_within_billing_limit.is_a?(Boolean) != false || raise("Passed value for field obj.bill_within_billing_limit is not the expected type, validation failed.")
      obj.bill_daily_breakdown.is_a?(Hash) != false || raise("Passed value for field obj.bill_daily_breakdown is not the expected type, validation failed.")
      obj.call_active.is_a?(Float) != false || raise("Passed value for field obj.call_active is not the expected type, validation failed.")
      obj.call_active_within_concurrency_limit.is_a?(Boolean) != false || raise("Passed value for field obj.call_active_within_concurrency_limit is not the expected type, validation failed.")
      obj.call_minutes.is_a?(Float) != false || raise("Passed value for field obj.call_minutes is not the expected type, validation failed.")
      obj.call_minutes_daily_breakdown.is_a?(Hash) != false || raise("Passed value for field obj.call_minutes_daily_breakdown is not the expected type, validation failed.")
      obj.call_minutes_average.is_a?(Float) != false || raise("Passed value for field obj.call_minutes_average is not the expected type, validation failed.")
      obj.call_minutes_average_daily_breakdown.is_a?(Hash) != false || raise("Passed value for field obj.call_minutes_average_daily_breakdown is not the expected type, validation failed.")
      obj.call_count.is_a?(Float) != false || raise("Passed value for field obj.call_count is not the expected type, validation failed.")
      obj.call_count_daily_breakdown.is_a?(Hash) != false || raise("Passed value for field obj.call_count_daily_breakdown is not the expected type, validation failed.")
    end
  end
end
