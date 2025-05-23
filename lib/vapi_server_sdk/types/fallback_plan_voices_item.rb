# frozen_string_literal: true

require "json"
require_relative "fallback_azure_voice"
require_relative "fallback_cartesia_voice"
require_relative "fallback_hume_voice"
require_relative "fallback_custom_voice"
require_relative "fallback_deepgram_voice"
require_relative "fallback_eleven_labs_voice"
require_relative "fallback_vapi_voice"
require_relative "fallback_lmnt_voice"
require_relative "fallback_open_ai_voice"
require_relative "fallback_play_ht_voice"
require_relative "fallback_rime_ai_voice"
require_relative "fallback_smallest_ai_voice"
require_relative "fallback_tavus_voice"

module Vapi
  class FallbackPlanVoicesItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::FallbackPlanVoicesItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of FallbackPlanVoicesItem
    #
    # @param json_object [String]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "azure"
                 Vapi::FallbackAzureVoice.from_json(json_object: json_object)
               when "cartesia"
                 Vapi::FallbackCartesiaVoice.from_json(json_object: json_object)
               when "hume"
                 Vapi::FallbackHumeVoice.from_json(json_object: json_object)
               when "custom-voice"
                 Vapi::FallbackCustomVoice.from_json(json_object: json_object)
               when "deepgram"
                 Vapi::FallbackDeepgramVoice.from_json(json_object: json_object)
               when "11labs"
                 Vapi::FallbackElevenLabsVoice.from_json(json_object: json_object)
               when "vapi"
                 Vapi::FallbackVapiVoice.from_json(json_object: json_object)
               when "lmnt"
                 Vapi::FallbackLmntVoice.from_json(json_object: json_object)
               when "openai"
                 Vapi::FallbackOpenAiVoice.from_json(json_object: json_object)
               when "playht"
                 Vapi::FallbackPlayHtVoice.from_json(json_object: json_object)
               when "rime-ai"
                 Vapi::FallbackRimeAiVoice.from_json(json_object: json_object)
               when "smallest-ai"
                 Vapi::FallbackSmallestAiVoice.from_json(json_object: json_object)
               when "tavus"
                 Vapi::FallbackTavusVoice.from_json(json_object: json_object)
               else
                 Vapi::FallbackAzureVoice.from_json(json_object: json_object)
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
      when "hume"
        { **@member.to_json, provider: @discriminant }.to_json
      when "custom-voice"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepgram"
        { **@member.to_json, provider: @discriminant }.to_json
      when "11labs"
        { **@member.to_json, provider: @discriminant }.to_json
      when "vapi"
        { **@member.to_json, provider: @discriminant }.to_json
      when "lmnt"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "playht"
        { **@member.to_json, provider: @discriminant }.to_json
      when "rime-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "smallest-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "tavus"
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
        Vapi::FallbackAzureVoice.validate_raw(obj: obj)
      when "cartesia"
        Vapi::FallbackCartesiaVoice.validate_raw(obj: obj)
      when "hume"
        Vapi::FallbackHumeVoice.validate_raw(obj: obj)
      when "custom-voice"
        Vapi::FallbackCustomVoice.validate_raw(obj: obj)
      when "deepgram"
        Vapi::FallbackDeepgramVoice.validate_raw(obj: obj)
      when "11labs"
        Vapi::FallbackElevenLabsVoice.validate_raw(obj: obj)
      when "vapi"
        Vapi::FallbackVapiVoice.validate_raw(obj: obj)
      when "lmnt"
        Vapi::FallbackLmntVoice.validate_raw(obj: obj)
      when "openai"
        Vapi::FallbackOpenAiVoice.validate_raw(obj: obj)
      when "playht"
        Vapi::FallbackPlayHtVoice.validate_raw(obj: obj)
      when "rime-ai"
        Vapi::FallbackRimeAiVoice.validate_raw(obj: obj)
      when "smallest-ai"
        Vapi::FallbackSmallestAiVoice.validate_raw(obj: obj)
      when "tavus"
        Vapi::FallbackTavusVoice.validate_raw(obj: obj)
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

    # @param member [Vapi::FallbackAzureVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.azure(member:)
      new(member: member, discriminant: "azure")
    end

    # @param member [Vapi::FallbackCartesiaVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.cartesia(member:)
      new(member: member, discriminant: "cartesia")
    end

    # @param member [Vapi::FallbackHumeVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.hume(member:)
      new(member: member, discriminant: "hume")
    end

    # @param member [Vapi::FallbackCustomVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.custom_voice(member:)
      new(member: member, discriminant: "custom-voice")
    end

    # @param member [Vapi::FallbackDeepgramVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end

    # @param member [Vapi::FallbackElevenLabsVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self._11_labs(member:)
      new(member: member, discriminant: "11labs")
    end

    # @param member [Vapi::FallbackVapiVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.vapi(member:)
      new(member: member, discriminant: "vapi")
    end

    # @param member [Vapi::FallbackLmntVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.lmnt(member:)
      new(member: member, discriminant: "lmnt")
    end

    # @param member [Vapi::FallbackOpenAiVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::FallbackPlayHtVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.playht(member:)
      new(member: member, discriminant: "playht")
    end

    # @param member [Vapi::FallbackRimeAiVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.rime_ai(member:)
      new(member: member, discriminant: "rime-ai")
    end

    # @param member [Vapi::FallbackSmallestAiVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.smallest_ai(member:)
      new(member: member, discriminant: "smallest-ai")
    end

    # @param member [Vapi::FallbackTavusVoice]
    # @return [Vapi::FallbackPlanVoicesItem]
    def self.tavus(member:)
      new(member: member, discriminant: "tavus")
    end
  end
end
