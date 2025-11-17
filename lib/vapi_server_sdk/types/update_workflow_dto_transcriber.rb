# frozen_string_literal: true

require "json"
require_relative "assembly_ai_transcriber"
require_relative "azure_speech_transcriber"
require_relative "custom_transcriber"
require_relative "deepgram_transcriber"
require_relative "eleven_labs_transcriber"
require_relative "gladia_transcriber"
require_relative "google_transcriber"
require_relative "speechmatics_transcriber"
require_relative "talkscriber_transcriber"
require_relative "open_ai_transcriber"
require_relative "cartesia_transcriber"

module Vapi
  # This is the transcriber for the workflow.
  #  This can be overridden at node level using `nodes[n].transcriber`.
  class UpdateWorkflowDtoTranscriber
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of UpdateWorkflowDtoTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "assembly-ai"
                 Vapi::AssemblyAiTranscriber.from_json(json_object: json_object)
               when "azure"
                 Vapi::AzureSpeechTranscriber.from_json(json_object: json_object)
               when "custom-transcriber"
                 Vapi::CustomTranscriber.from_json(json_object: json_object)
               when "deepgram"
                 Vapi::DeepgramTranscriber.from_json(json_object: json_object)
               when "11labs"
                 Vapi::ElevenLabsTranscriber.from_json(json_object: json_object)
               when "gladia"
                 Vapi::GladiaTranscriber.from_json(json_object: json_object)
               when "google"
                 Vapi::GoogleTranscriber.from_json(json_object: json_object)
               when "speechmatics"
                 Vapi::SpeechmaticsTranscriber.from_json(json_object: json_object)
               when "talkscriber"
                 Vapi::TalkscriberTranscriber.from_json(json_object: json_object)
               when "openai"
                 Vapi::OpenAiTranscriber.from_json(json_object: json_object)
               when "cartesia"
                 Vapi::CartesiaTranscriber.from_json(json_object: json_object)
               else
                 Vapi::AssemblyAiTranscriber.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.provider)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
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
      when "speechmatics"
        { **@member.to_json, provider: @discriminant }.to_json
      when "talkscriber"
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
        Vapi::AssemblyAiTranscriber.validate_raw(obj: obj)
      when "azure"
        Vapi::AzureSpeechTranscriber.validate_raw(obj: obj)
      when "custom-transcriber"
        Vapi::CustomTranscriber.validate_raw(obj: obj)
      when "deepgram"
        Vapi::DeepgramTranscriber.validate_raw(obj: obj)
      when "11labs"
        Vapi::ElevenLabsTranscriber.validate_raw(obj: obj)
      when "gladia"
        Vapi::GladiaTranscriber.validate_raw(obj: obj)
      when "google"
        Vapi::GoogleTranscriber.validate_raw(obj: obj)
      when "speechmatics"
        Vapi::SpeechmaticsTranscriber.validate_raw(obj: obj)
      when "talkscriber"
        Vapi::TalkscriberTranscriber.validate_raw(obj: obj)
      when "openai"
        Vapi::OpenAiTranscriber.validate_raw(obj: obj)
      when "cartesia"
        Vapi::CartesiaTranscriber.validate_raw(obj: obj)
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

    # @param member [Vapi::AssemblyAiTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.assembly_ai(member:)
      new(member: member, discriminant: "assembly-ai")
    end

    # @param member [Vapi::AzureSpeechTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.azure(member:)
      new(member: member, discriminant: "azure")
    end

    # @param member [Vapi::CustomTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.custom_transcriber(member:)
      new(member: member, discriminant: "custom-transcriber")
    end

    # @param member [Vapi::DeepgramTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end

    # @param member [Vapi::ElevenLabsTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self._11_labs(member:)
      new(member: member, discriminant: "11labs")
    end

    # @param member [Vapi::GladiaTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.gladia(member:)
      new(member: member, discriminant: "gladia")
    end

    # @param member [Vapi::GoogleTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.google(member:)
      new(member: member, discriminant: "google")
    end

    # @param member [Vapi::SpeechmaticsTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.speechmatics(member:)
      new(member: member, discriminant: "speechmatics")
    end

    # @param member [Vapi::TalkscriberTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.talkscriber(member:)
      new(member: member, discriminant: "talkscriber")
    end

    # @param member [Vapi::OpenAiTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::CartesiaTranscriber]
    # @return [Vapi::UpdateWorkflowDtoTranscriber]
    def self.cartesia(member:)
      new(member: member, discriminant: "cartesia")
    end
  end
end
