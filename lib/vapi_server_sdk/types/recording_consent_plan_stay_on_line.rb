# frozen_string_literal: true

require_relative "recording_consent_plan_stay_on_line_voice"
require "ostruct"
require "json"

module Vapi
  class RecordingConsentPlanStayOnLine
    # @return [String] This is the message asking for consent to record the call.
    #  If the type is `stay-on-line`, the message should ask the user to hang up if
    #  they do not consent.
    #  If the type is `verbal`, the message should ask the user to verbally consent or
    #  decline.
    attr_reader :message
    # @return [Vapi::RecordingConsentPlanStayOnLineVoice] This is the voice to use for the consent message. If not specified, inherits
    #  from the assistant's voice.
    #  Use a different voice for the consent message for a better user experience.
    attr_reader :voice
    # @return [Float] Number of seconds to wait before transferring to the assistant if user stays on
    #  the call
    attr_reader :wait_seconds
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] This is the message asking for consent to record the call.
    #  If the type is `stay-on-line`, the message should ask the user to hang up if
    #  they do not consent.
    #  If the type is `verbal`, the message should ask the user to verbally consent or
    #  decline.
    # @param voice [Vapi::RecordingConsentPlanStayOnLineVoice] This is the voice to use for the consent message. If not specified, inherits
    #  from the assistant's voice.
    #  Use a different voice for the consent message for a better user experience.
    # @param wait_seconds [Float] Number of seconds to wait before transferring to the assistant if user stays on
    #  the call
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RecordingConsentPlanStayOnLine]
    def initialize(message:, voice: OMIT, wait_seconds: OMIT, additional_properties: nil)
      @message = message
      @voice = voice if voice != OMIT
      @wait_seconds = wait_seconds if wait_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "voice": voice, "waitSeconds": wait_seconds }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RecordingConsentPlanStayOnLine
    #
    # @param json_object [String]
    # @return [Vapi::RecordingConsentPlanStayOnLine]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      if parsed_json["voice"].nil?
        voice = nil
      else
        voice = parsed_json["voice"].to_json
        voice = Vapi::RecordingConsentPlanStayOnLineVoice.from_json(json_object: voice)
      end
      wait_seconds = parsed_json["waitSeconds"]
      new(
        message: message,
        voice: voice,
        wait_seconds: wait_seconds,
        additional_properties: struct
      )
    end

    # Serialize an instance of RecordingConsentPlanStayOnLine to a JSON object
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
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.voice.nil? || Vapi::RecordingConsentPlanStayOnLineVoice.validate_raw(obj: obj.voice)
      obj.wait_seconds&.is_a?(Float) != false || raise("Passed value for field obj.wait_seconds is not the expected type, validation failed.")
    end
  end
end
