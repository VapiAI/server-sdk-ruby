# frozen_string_literal: true

require_relative "voicemail_detection_backoff_plan"
require "ostruct"
require "json"

module Vapi
  class GoogleVoicemailDetectionPlan
    # @return [Float] This is the maximum duration from the start of the call that we will wait for a
    #  voicemail beep, before speaking our message
    #  - If we detect a voicemail beep before this, we will speak the message at that
    #  point.
    #  - Setting too low a value means that the bot will start speaking its voicemail
    #  message too early. If it does so before the actual beep, it will get cut off.
    #  You should definitely tune this to your use case.
    #  @default 30
    #  @min 0
    #  @max 60
    attr_reader :beep_max_await_seconds
    # @return [Vapi::VoicemailDetectionBackoffPlan] This is the backoff plan for the voicemail detection.
    attr_reader :backoff_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param beep_max_await_seconds [Float] This is the maximum duration from the start of the call that we will wait for a
    #  voicemail beep, before speaking our message
    #  - If we detect a voicemail beep before this, we will speak the message at that
    #  point.
    #  - Setting too low a value means that the bot will start speaking its voicemail
    #  message too early. If it does so before the actual beep, it will get cut off.
    #  You should definitely tune this to your use case.
    #  @default 30
    #  @min 0
    #  @max 60
    # @param backoff_plan [Vapi::VoicemailDetectionBackoffPlan] This is the backoff plan for the voicemail detection.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GoogleVoicemailDetectionPlan]
    def initialize(beep_max_await_seconds: OMIT, backoff_plan: OMIT, additional_properties: nil)
      @beep_max_await_seconds = beep_max_await_seconds if beep_max_await_seconds != OMIT
      @backoff_plan = backoff_plan if backoff_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "beepMaxAwaitSeconds": beep_max_await_seconds, "backoffPlan": backoff_plan }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GoogleVoicemailDetectionPlan
    #
    # @param json_object [String]
    # @return [Vapi::GoogleVoicemailDetectionPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      beep_max_await_seconds = parsed_json["beepMaxAwaitSeconds"]
      if parsed_json["backoffPlan"].nil?
        backoff_plan = nil
      else
        backoff_plan = parsed_json["backoffPlan"].to_json
        backoff_plan = Vapi::VoicemailDetectionBackoffPlan.from_json(json_object: backoff_plan)
      end
      new(
        beep_max_await_seconds: beep_max_await_seconds,
        backoff_plan: backoff_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of GoogleVoicemailDetectionPlan to a JSON object
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
      obj.beep_max_await_seconds&.is_a?(Float) != false || raise("Passed value for field obj.beep_max_await_seconds is not the expected type, validation failed.")
      obj.backoff_plan.nil? || Vapi::VoicemailDetectionBackoffPlan.validate_raw(obj: obj.backoff_plan)
    end
  end
end
