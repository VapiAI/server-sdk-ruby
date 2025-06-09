# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class BackoffPlan
  # @return [Hash{String => Object}] This is the type of backoff plan to use. Defaults to fixed.
#  @default fixed
    attr_reader :type
  # @return [Float] This is the maximum number of retries to attempt if the request fails. Defaults
#  to 0 (no retries).
#  @default 0
    attr_reader :max_retries
  # @return [Float] This is the base delay in seconds. For linear backoff, this is the delay between
#  each retry. For exponential backoff, this is the initial delay.
    attr_reader :base_delay_seconds
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Hash{String => Object}] This is the type of backoff plan to use. Defaults to fixed.
#  @default fixed
    # @param max_retries [Float] This is the maximum number of retries to attempt if the request fails. Defaults
#  to 0 (no retries).
#  @default 0
    # @param base_delay_seconds [Float] This is the base delay in seconds. For linear backoff, this is the delay between
#  each retry. For exponential backoff, this is the initial delay.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BackoffPlan]
    def initialize(type:, max_retries:, base_delay_seconds:, additional_properties: nil)
      @type = type
      @max_retries = max_retries
      @base_delay_seconds = base_delay_seconds
      @additional_properties = additional_properties
      @_field_set = { "type": type, "maxRetries": max_retries, "baseDelaySeconds": base_delay_seconds }
    end
# Deserialize a JSON object to an instance of BackoffPlan
    #
    # @param json_object [String] 
    # @return [Vapi::BackoffPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      max_retries = parsed_json["maxRetries"]
      base_delay_seconds = parsed_json["baseDelaySeconds"]
      new(
        type: type,
        max_retries: max_retries,
        base_delay_seconds: base_delay_seconds,
        additional_properties: struct
      )
    end
# Serialize an instance of BackoffPlan to a JSON object
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
      obj.type.is_a?(Hash) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.max_retries.is_a?(Float) != false || raise("Passed value for field obj.max_retries is not the expected type, validation failed.")
      obj.base_delay_seconds.is_a?(Float) != false || raise("Passed value for field obj.base_delay_seconds is not the expected type, validation failed.")
    end
  end
end