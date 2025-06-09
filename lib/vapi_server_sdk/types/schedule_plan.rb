# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class SchedulePlan
  # @return [DateTime] This is the ISO 8601 date-time string of the earliest time the call can be
#  scheduled.
    attr_reader :earliest_at
  # @return [DateTime] This is the ISO 8601 date-time string of the latest time the call can be
#  scheduled.
    attr_reader :latest_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param earliest_at [DateTime] This is the ISO 8601 date-time string of the earliest time the call can be
#  scheduled.
    # @param latest_at [DateTime] This is the ISO 8601 date-time string of the latest time the call can be
#  scheduled.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SchedulePlan]
    def initialize(earliest_at:, latest_at: OMIT, additional_properties: nil)
      @earliest_at = earliest_at
      @latest_at = latest_at if latest_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "earliestAt": earliest_at, "latestAt": latest_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SchedulePlan
    #
    # @param json_object [String] 
    # @return [Vapi::SchedulePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      earliest_at = unless parsed_json["earliestAt"].nil?
  DateTime.parse(parsed_json["earliestAt"])
else
  nil
end
      latest_at = unless parsed_json["latestAt"].nil?
  DateTime.parse(parsed_json["latestAt"])
else
  nil
end
      new(
        earliest_at: earliest_at,
        latest_at: latest_at,
        additional_properties: struct
      )
    end
# Serialize an instance of SchedulePlan to a JSON object
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
      obj.earliest_at.is_a?(DateTime) != false || raise("Passed value for field obj.earliest_at is not the expected type, validation failed.")
      obj.latest_at&.is_a?(DateTime) != false || raise("Passed value for field obj.latest_at is not the expected type, validation failed.")
    end
  end
end