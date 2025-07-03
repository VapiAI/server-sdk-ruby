# frozen_string_literal: true
require "json"
require_relative "fallback_assembly_ai_transcriber"
require_relative "fallback_azure_speech_transcriber"
require_relative "fallback_custom_transcriber"
require_relative "fallback_deepgram_transcriber"
require_relative "fallback_eleven_labs_transcriber"
require_relative "fallback_gladia_transcriber"
require_relative "fallback_google_transcriber"
require_relative "fallback_talkscriber_transcriber"
require_relative "fallback_speechmatics_transcriber"
require_relative "fallback_open_ai_transcriber"
require_relative "fallback_cartesia_transcriber"

module Vapi
  class FallbackTranscriberPlanTranscribersItem
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  FallbackTranscriberPlanTranscribersItem
    #
    # @param json_object [String] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.provider
      when "assembly-ai"
        member = Vapi::FallbackAssemblyAiTranscriber.from_json(json_object: json_object)
      when "azure"
        member = Vapi::FallbackAzureSpeechTranscriber.from_json(json_object: json_object)
      when "custom-transcriber"
        member = Vapi::FallbackCustomTranscriber.from_json(json_object: json_object)
      when "deepgram"
        member = Vapi::FallbackDeepgramTranscriber.from_json(json_object: json_object)
      when "11labs"
        member = Vapi::FallbackElevenLabsTranscriber.from_json(json_object: json_object)
      when "gladia"
        member = Vapi::FallbackGladiaTranscriber.from_json(json_object: json_object)
      when "google"
        member = Vapi::FallbackGoogleTranscriber.from_json(json_object: json_object)
      when "talkscriber"
        member = Vapi::FallbackTalkscriberTranscriber.from_json(json_object: json_object)
      when "speechmatics"
        member = Vapi::FallbackSpeechmaticsTranscriber.from_json(json_object: json_object)
      when "openai"
        member = Vapi::FallbackOpenAiTranscriber.from_json(json_object: json_object)
      when "cartesia"
        member = Vapi::FallbackCartesiaTranscriber.from_json(json_object: json_object)
      else
        member = Vapi::FallbackAssemblyAiTranscriber.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.provider)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "assembly-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "azure"
        { **@member.to_json, provider: @discriminant }.to_json
      when "custom-transcriber"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepgram"
        { **@member.to_json, provider: @discriminant }.to_json
      when "11labs"
        { **@member.to_json, provider: @discriminant }.to_json
      when "gladia"
        { **@member.to_json, provider: @discriminant }.to_json
      when "google"
        { **@member.to_json, provider: @discriminant }.to_json
      when "talkscriber"
        { **@member.to_json, provider: @discriminant }.to_json
      when "speechmatics"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "cartesia"
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
      when "assembly-ai"
        Vapi::FallbackAssemblyAiTranscriber.validate_raw(obj: obj)
      when "azure"
        Vapi::FallbackAzureSpeechTranscriber.validate_raw(obj: obj)
      when "custom-transcriber"
        Vapi::FallbackCustomTranscriber.validate_raw(obj: obj)
      when "deepgram"
        Vapi::FallbackDeepgramTranscriber.validate_raw(obj: obj)
      when "11labs"
        Vapi::FallbackElevenLabsTranscriber.validate_raw(obj: obj)
      when "gladia"
        Vapi::FallbackGladiaTranscriber.validate_raw(obj: obj)
      when "google"
        Vapi::FallbackGoogleTranscriber.validate_raw(obj: obj)
      when "talkscriber"
        Vapi::FallbackTalkscriberTranscriber.validate_raw(obj: obj)
      when "speechmatics"
        Vapi::FallbackSpeechmaticsTranscriber.validate_raw(obj: obj)
      when "openai"
        Vapi::FallbackOpenAiTranscriber.validate_raw(obj: obj)
      when "cartesia"
        Vapi::FallbackCartesiaTranscriber.validate_raw(obj: obj)
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
    # @param member [Vapi::FallbackAssemblyAiTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.assembly_ai(member:)
      new(member: member, discriminant: "assembly-ai")
    end
    # @param member [Vapi::FallbackAzureSpeechTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.azure(member:)
      new(member: member, discriminant: "azure")
    end
    # @param member [Vapi::FallbackCustomTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.custom_transcriber(member:)
      new(member: member, discriminant: "custom-transcriber")
    end
    # @param member [Vapi::FallbackDeepgramTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end
    # @param member [Vapi::FallbackElevenLabsTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self._11_labs(member:)
      new(member: member, discriminant: "11labs")
    end
    # @param member [Vapi::FallbackGladiaTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.gladia(member:)
      new(member: member, discriminant: "gladia")
    end
    # @param member [Vapi::FallbackGoogleTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.google(member:)
      new(member: member, discriminant: "google")
    end
    # @param member [Vapi::FallbackTalkscriberTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.talkscriber(member:)
      new(member: member, discriminant: "talkscriber")
    end
    # @param member [Vapi::FallbackSpeechmaticsTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.speechmatics(member:)
      new(member: member, discriminant: "speechmatics")
    end
    # @param member [Vapi::FallbackOpenAiTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end
    # @param member [Vapi::FallbackCartesiaTranscriber] 
    # @return [Vapi::FallbackTranscriberPlanTranscribersItem]
    def self.cartesia(member:)
      new(member: member, discriminant: "cartesia")
    end
  end
end