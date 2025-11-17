# frozen_string_literal: true

require_relative "recording_consent_plan_verbal_voice"
require "ostruct"
require "json"

module Vapi
  class RecordingConsentPlanVerbal
    # @return [String] This is the message asking for consent to record the call.
    #  If the type is `stay-on-line`, the message should ask the user to hang up if
    #  they do not consent.
    #  If the type is `verbal`, the message should ask the user to verbally consent or
    #  decline.
    attr_reader :message
    # @return [Vapi::RecordingConsentPlanVerbalVoice] This is the voice to use for the consent message. If not specified, inherits
    #  from the assistant's voice.
    #  Use a different voice for the consent message for a better user experience.
    attr_reader :voice
    # @return [Hash{String => Object}] Tool to execute if user verbally declines recording consent
    attr_reader :decline_tool
    # @return [String] ID of existing tool to execute if user verbally declines recording consent
    attr_reader :decline_tool_id
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
    # @param voice [Vapi::RecordingConsentPlanVerbalVoice] This is the voice to use for the consent message. If not specified, inherits
    #  from the assistant's voice.
    #  Use a different voice for the consent message for a better user experience.
    # @param decline_tool [Hash{String => Object}] Tool to execute if user verbally declines recording consent
    # @param decline_tool_id [String] ID of existing tool to execute if user verbally declines recording consent
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RecordingConsentPlanVerbal]
    def initialize(message:, voice: OMIT, decline_tool: OMIT, decline_tool_id: OMIT, additional_properties: nil)
      @message = message
      @voice = voice if voice != OMIT
      @decline_tool = decline_tool if decline_tool != OMIT
      @decline_tool_id = decline_tool_id if decline_tool_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "message": message,
        "voice": voice,
        "declineTool": decline_tool,
        "declineToolId": decline_tool_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RecordingConsentPlanVerbal
    #
    # @param json_object [String]
    # @return [Vapi::RecordingConsentPlanVerbal]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      if parsed_json["voice"].nil?
        voice = nil
      else
        voice = parsed_json["voice"].to_json
        voice = Vapi::RecordingConsentPlanVerbalVoice.from_json(json_object: voice)
      end
      decline_tool = parsed_json["declineTool"]
      decline_tool_id = parsed_json["declineToolId"]
      new(
        message: message,
        voice: voice,
        decline_tool: decline_tool,
        decline_tool_id: decline_tool_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of RecordingConsentPlanVerbal to a JSON object
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
      obj.voice.nil? || Vapi::RecordingConsentPlanVerbalVoice.validate_raw(obj: obj.voice)
      obj.decline_tool&.is_a?(Hash) != false || raise("Passed value for field obj.decline_tool is not the expected type, validation failed.")
      obj.decline_tool_id&.is_a?(String) != false || raise("Passed value for field obj.decline_tool_id is not the expected type, validation failed.")
    end
  end
end
