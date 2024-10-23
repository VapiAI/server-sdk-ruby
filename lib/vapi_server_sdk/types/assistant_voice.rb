# frozen_string_literal: true

require "json"
require_relative "azure_voice"
require_relative "cartesia_voice"
require_relative "deepgram_voice"
require_relative "eleven_labs_voice"
require_relative "lmnt_voice"
require_relative "neets_voice"
require_relative "open_ai_voice"
require_relative "play_ht_voice"
require_relative "rime_ai_voice"

module Vapi
  # These are the options for the assistant's voice.
  class AssistantVoice
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::AssistantVoice]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of AssistantVoice
    #
    # @param json_object [String]
    # @return [Vapi::AssistantVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "azure"
                 Vapi::AzureVoice.from_json(json_object: json_object)
               when "cartesia"
                 Vapi::CartesiaVoice.from_json(json_object: json_object)
               when "deepgram"
                 Vapi::DeepgramVoice.from_json(json_object: json_object)
               when "11labs"
                 Vapi::ElevenLabsVoice.from_json(json_object: json_object)
               when "lmnt"
                 Vapi::LmntVoice.from_json(json_object: json_object)
               when "neets"
                 Vapi::NeetsVoice.from_json(json_object: json_object)
               when "openai"
                 Vapi::OpenAiVoice.from_json(json_object: json_object)
               when "playht"
                 Vapi::PlayHtVoice.from_json(json_object: json_object)
               when "rime-ai"
                 Vapi::RimeAiVoice.from_json(json_object: json_object)
               else
                 Vapi::AzureVoice.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.provider)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "azure"
        { **@member.to_json, provider: @discriminant }.to_json
      when "cartesia"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepgram"
        { **@member.to_json, provider: @discriminant }.to_json
      when "11labs"
        { **@member.to_json, provider: @discriminant }.to_json
      when "lmnt"
        { **@member.to_json, provider: @discriminant }.to_json
      when "neets"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "playht"
        { **@member.to_json, provider: @discriminant }.to_json
      when "rime-ai"
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
      when "azure"
        Vapi::AzureVoice.validate_raw(obj: obj)
      when "cartesia"
        Vapi::CartesiaVoice.validate_raw(obj: obj)
      when "deepgram"
        Vapi::DeepgramVoice.validate_raw(obj: obj)
      when "11labs"
        Vapi::ElevenLabsVoice.validate_raw(obj: obj)
      when "lmnt"
        Vapi::LmntVoice.validate_raw(obj: obj)
      when "neets"
        Vapi::NeetsVoice.validate_raw(obj: obj)
      when "openai"
        Vapi::OpenAiVoice.validate_raw(obj: obj)
      when "playht"
        Vapi::PlayHtVoice.validate_raw(obj: obj)
      when "rime-ai"
        Vapi::RimeAiVoice.validate_raw(obj: obj)
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

    # @param member [Vapi::AzureVoice]
    # @return [Vapi::AssistantVoice]
    def self.azure(member:)
      new(member: member, discriminant: "azure")
    end

    # @param member [Vapi::CartesiaVoice]
    # @return [Vapi::AssistantVoice]
    def self.cartesia(member:)
      new(member: member, discriminant: "cartesia")
    end

    # @param member [Vapi::DeepgramVoice]
    # @return [Vapi::AssistantVoice]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end

    # @param member [Vapi::ElevenLabsVoice]
    # @return [Vapi::AssistantVoice]
    def self._11_labs(member:)
      new(member: member, discriminant: "11labs")
    end

    # @param member [Vapi::LmntVoice]
    # @return [Vapi::AssistantVoice]
    def self.lmnt(member:)
      new(member: member, discriminant: "lmnt")
    end

    # @param member [Vapi::NeetsVoice]
    # @return [Vapi::AssistantVoice]
    def self.neets(member:)
      new(member: member, discriminant: "neets")
    end

    # @param member [Vapi::OpenAiVoice]
    # @return [Vapi::AssistantVoice]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::PlayHtVoice]
    # @return [Vapi::AssistantVoice]
    def self.playht(member:)
      new(member: member, discriminant: "playht")
    end

    # @param member [Vapi::RimeAiVoice]
    # @return [Vapi::AssistantVoice]
    def self.rime_ai(member:)
      new(member: member, discriminant: "rime-ai")
    end
  end
end
