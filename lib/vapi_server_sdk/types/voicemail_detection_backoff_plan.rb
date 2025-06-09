# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class VoicemailDetectionBackoffPlan
  # @return [Float] This is the number of seconds to wait before starting the first retry attempt.
    attr_reader :start_at_seconds
  # @return [Float] This is the interval in seconds between retry attempts.
    attr_reader :frequency_seconds
  # @return [Float] This is the maximum number of retry attempts before giving up.
    attr_reader :max_retries
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param start_at_seconds [Float] This is the number of seconds to wait before starting the first retry attempt.
    # @param frequency_seconds [Float] This is the interval in seconds between retry attempts.
    # @param max_retries [Float] This is the maximum number of retry attempts before giving up.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VoicemailDetectionBackoffPlan]
    def initialize(start_at_seconds: OMIT, frequency_seconds: OMIT, max_retries: OMIT, additional_properties: nil)
      @start_at_seconds = start_at_seconds if start_at_seconds != OMIT
      @frequency_seconds = frequency_seconds if frequency_seconds != OMIT
      @max_retries = max_retries if max_retries != OMIT
      @additional_properties = additional_properties
      @_field_set = { "startAtSeconds": start_at_seconds, "frequencySeconds": frequency_seconds, "maxRetries": max_retries }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VoicemailDetectionBackoffPlan
    #
    # @param json_object [String] 
    # @return [Vapi::VoicemailDetectionBackoffPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      start_at_seconds = parsed_json["startAtSeconds"]
      frequency_seconds = parsed_json["frequencySeconds"]
      max_retries = parsed_json["maxRetries"]
      new(
        start_at_seconds: start_at_seconds,
        frequency_seconds: frequency_seconds,
        max_retries: max_retries,
        additional_properties: struct
      )
    end
# Serialize an instance of VoicemailDetectionBackoffPlan to a JSON object
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
      obj.start_at_seconds&.is_a?(Float) != false || raise("Passed value for field obj.start_at_seconds is not the expected type, validation failed.")
      obj.frequency_seconds&.is_a?(Float) != false || raise("Passed value for field obj.frequency_seconds is not the expected type, validation failed.")
      obj.max_retries&.is_a?(Float) != false || raise("Passed value for field obj.max_retries is not the expected type, validation failed.")
    end
  end
end