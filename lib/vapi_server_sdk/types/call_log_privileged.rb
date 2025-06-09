# frozen_string_literal: true
require_relative "call_log_privileged_level"
require "date"
require "ostruct"
require "json"

module Vapi
  class CallLogPrivileged
  # @return [String] This is the unique identifier for the call.
    attr_reader :call_id
  # @return [String] This is the unique identifier for the org that this call log belongs to.
    attr_reader :org_id
  # @return [String] This is the log message associated with the call.
    attr_reader :log
  # @return [Vapi::CallLogPrivilegedLevel] This is the level of the log message.
    attr_reader :level
  # @return [DateTime] This is the ISO 8601 date-time string of when the log was created.
    attr_reader :time
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param call_id [String] This is the unique identifier for the call.
    # @param org_id [String] This is the unique identifier for the org that this call log belongs to.
    # @param log [String] This is the log message associated with the call.
    # @param level [Vapi::CallLogPrivilegedLevel] This is the level of the log message.
    # @param time [DateTime] This is the ISO 8601 date-time string of when the log was created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CallLogPrivileged]
    def initialize(call_id:, org_id:, log:, level:, time:, additional_properties: nil)
      @call_id = call_id
      @org_id = org_id
      @log = log
      @level = level
      @time = time
      @additional_properties = additional_properties
      @_field_set = { "callId": call_id, "orgId": org_id, "log": log, "level": level, "time": time }
    end
# Deserialize a JSON object to an instance of CallLogPrivileged
    #
    # @param json_object [String] 
    # @return [Vapi::CallLogPrivileged]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      call_id = parsed_json["callId"]
      org_id = parsed_json["orgId"]
      log = parsed_json["log"]
      level = parsed_json["level"]
      time = unless parsed_json["time"].nil?
  DateTime.parse(parsed_json["time"])
else
  nil
end
      new(
        call_id: call_id,
        org_id: org_id,
        log: log,
        level: level,
        time: time,
        additional_properties: struct
      )
    end
# Serialize an instance of CallLogPrivileged to a JSON object
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
      obj.call_id.is_a?(String) != false || raise("Passed value for field obj.call_id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.log.is_a?(String) != false || raise("Passed value for field obj.log is not the expected type, validation failed.")
      obj.level.is_a?(Vapi::CallLogPrivilegedLevel) != false || raise("Passed value for field obj.level is not the expected type, validation failed.")
      obj.time.is_a?(DateTime) != false || raise("Passed value for field obj.time is not the expected type, validation failed.")
    end
  end
end