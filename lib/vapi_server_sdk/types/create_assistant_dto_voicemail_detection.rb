# frozen_string_literal: true

require "json"
require_relative "google_voicemail_detection_plan"
require_relative "open_ai_voicemail_detection_plan"
require_relative "twilio_voicemail_detection_plan"
require_relative "vapi_voicemail_detection_plan"

module Vapi
  # These are the settings to configure or disable voicemail detection.
  #  Alternatively, voicemail detection can be configured using the
  #  model.tools=[VoicemailTool].
  #  This uses Twilio's built-in detection while the VoicemailTool relies on the
  #  model to detect if a voicemail was reached.
  #  You can use neither of them, one of them, or both of them. By default, Twilio
  #  built-in detection is enabled while VoicemailTool is not.
  class CreateAssistantDtoVoicemailDetection
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::CreateAssistantDtoVoicemailDetection]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of CreateAssistantDtoVoicemailDetection
    #
    # @param json_object [String]
    # @return [Vapi::CreateAssistantDtoVoicemailDetection]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "google"
                 Vapi::GoogleVoicemailDetectionPlan.from_json(json_object: json_object)
               when "openai"
                 Vapi::OpenAiVoicemailDetectionPlan.from_json(json_object: json_object)
               when "twilio"
                 Vapi::TwilioVoicemailDetectionPlan.from_json(json_object: json_object)
               when "vapi"
                 Vapi::VapiVoicemailDetectionPlan.from_json(json_object: json_object)
               else
                 Vapi::GoogleVoicemailDetectionPlan.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.provider)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "google"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "twilio"
        { **@member.to_json, provider: @discriminant }.to_json
      when "vapi"
        { **@member.to_json, provider: @discriminant }.to_json
      else
        { "provider": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.provider
      when "google"
        Vapi::GoogleVoicemailDetectionPlan.validate_raw(obj: obj)
      when "openai"
        Vapi::OpenAiVoicemailDetectionPlan.validate_raw(obj: obj)
      when "twilio"
        Vapi::TwilioVoicemailDetectionPlan.validate_raw(obj: obj)
      when "vapi"
        Vapi::VapiVoicemailDetectionPlan.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::GoogleVoicemailDetectionPlan]
    # @return [Vapi::CreateAssistantDtoVoicemailDetection]
    def self.google(member:)
      new(member: member, discriminant: "google")
    end

    # @param member [Vapi::OpenAiVoicemailDetectionPlan]
    # @return [Vapi::CreateAssistantDtoVoicemailDetection]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::TwilioVoicemailDetectionPlan]
    # @return [Vapi::CreateAssistantDtoVoicemailDetection]
    def self.twilio(member:)
      new(member: member, discriminant: "twilio")
    end

    # @param member [Vapi::VapiVoicemailDetectionPlan]
    # @return [Vapi::CreateAssistantDtoVoicemailDetection]
    def self.vapi(member:)
      new(member: member, discriminant: "vapi")
    end
  end
end
