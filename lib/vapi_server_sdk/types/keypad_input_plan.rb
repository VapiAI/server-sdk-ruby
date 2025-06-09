# frozen_string_literal: true
require_relative "keypad_input_plan_delimiters"
require "ostruct"
require "json"

module Vapi
  class KeypadInputPlan
  # @return [Boolean] This keeps track of whether the user has enabled keypad input.
#  By default, it is off.
#  @default false
    attr_reader :enabled
  # @return [Float] This is the time in seconds to wait before processing the input.
#  If the input is not received within this time, the input will be ignored.
#  If set to "off", the input will be processed when the user enters a delimiter or
#  immediately if no delimiter is used.
#  @default 2
    attr_reader :timeout_seconds
  # @return [Vapi::KeypadInputPlanDelimiters] This is the delimiter(s) that will be used to process the input.
#  Can be '#', '*', or an empty array.
    attr_reader :delimiters
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] This keeps track of whether the user has enabled keypad input.
#  By default, it is off.
#  @default false
    # @param timeout_seconds [Float] This is the time in seconds to wait before processing the input.
#  If the input is not received within this time, the input will be ignored.
#  If set to "off", the input will be processed when the user enters a delimiter or
#  immediately if no delimiter is used.
#  @default 2
    # @param delimiters [Vapi::KeypadInputPlanDelimiters] This is the delimiter(s) that will be used to process the input.
#  Can be '#', '*', or an empty array.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::KeypadInputPlan]
    def initialize(enabled: OMIT, timeout_seconds: OMIT, delimiters: OMIT, additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @delimiters = delimiters if delimiters != OMIT
      @additional_properties = additional_properties
      @_field_set = { "enabled": enabled, "timeoutSeconds": timeout_seconds, "delimiters": delimiters }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of KeypadInputPlan
    #
    # @param json_object [String] 
    # @return [Vapi::KeypadInputPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      delimiters = parsed_json["delimiters"]
      new(
        enabled: enabled,
        timeout_seconds: timeout_seconds,
        delimiters: delimiters,
        additional_properties: struct
      )
    end
# Serialize an instance of KeypadInputPlan to a JSON object
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
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.delimiters&.is_a?(Vapi::KeypadInputPlanDelimiters) != false || raise("Passed value for field obj.delimiters is not the expected type, validation failed.")
    end
  end
end