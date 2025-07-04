# frozen_string_literal: true

require "json"
require_relative "azure_voice"
require_relative "cartesia_voice"
require_relative "custom_voice"
require_relative "deepgram_voice"
require_relative "eleven_labs_voice"
require_relative "hume_voice"
require_relative "lmnt_voice"
require_relative "neuphonic_voice"
require_relative "open_ai_voice"
require_relative "play_ht_voice"
require_relative "rime_ai_voice"
require_relative "smallest_ai_voice"
require_relative "tavus_voice"
require_relative "vapi_voice"
require_relative "sesame_voice"
require_relative "inworld_voice"

module Vapi
  # This is the voice for the workflow.
  #  This can be overridden at node level using `nodes[n].voice`.
  class CreateWorkflowDtoVoice
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of CreateWorkflowDtoVoice
    #
    # @param json_object [String]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "azure"
                 Vapi::AzureVoice.from_json(json_object: json_object)
               when "cartesia"
                 Vapi::CartesiaVoice.from_json(json_object: json_object)
               when "custom-voice"
                 Vapi::CustomVoice.from_json(json_object: json_object)
               when "deepgram"
                 Vapi::DeepgramVoice.from_json(json_object: json_object)
               when "11labs"
                 Vapi::ElevenLabsVoice.from_json(json_object: json_object)
               when "hume"
                 Vapi::HumeVoice.from_json(json_object: json_object)
               when "lmnt"
                 Vapi::LmntVoice.from_json(json_object: json_object)
               when "neuphonic"
                 Vapi::NeuphonicVoice.from_json(json_object: json_object)
               when "openai"
                 Vapi::OpenAiVoice.from_json(json_object: json_object)
               when "playht"
                 Vapi::PlayHtVoice.from_json(json_object: json_object)
               when "rime-ai"
                 Vapi::RimeAiVoice.from_json(json_object: json_object)
               when "smallest-ai"
                 Vapi::SmallestAiVoice.from_json(json_object: json_object)
               when "tavus"
                 Vapi::TavusVoice.from_json(json_object: json_object)
               when "vapi"
                 Vapi::VapiVoice.from_json(json_object: json_object)
               when "sesame"
                 Vapi::SesameVoice.from_json(json_object: json_object)
               when "inworld"
                 Vapi::InworldVoice.from_json(json_object: json_object)
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
      when "custom-voice"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepgram"
        { **@member.to_json, provider: @discriminant }.to_json
      when "11labs"
        { **@member.to_json, provider: @discriminant }.to_json
      when "hume"
        { **@member.to_json, provider: @discriminant }.to_json
      when "lmnt"
        { **@member.to_json, provider: @discriminant }.to_json
      when "neuphonic"
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
      when "vapi"
        { **@member.to_json, provider: @discriminant }.to_json
      when "sesame"
        { **@member.to_json, provider: @discriminant }.to_json
      when "inworld"
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
      when "custom-voice"
        Vapi::CustomVoice.validate_raw(obj: obj)
      when "deepgram"
        Vapi::DeepgramVoice.validate_raw(obj: obj)
      when "11labs"
        Vapi::ElevenLabsVoice.validate_raw(obj: obj)
      when "hume"
        Vapi::HumeVoice.validate_raw(obj: obj)
      when "lmnt"
        Vapi::LmntVoice.validate_raw(obj: obj)
      when "neuphonic"
        Vapi::NeuphonicVoice.validate_raw(obj: obj)
      when "openai"
        Vapi::OpenAiVoice.validate_raw(obj: obj)
      when "playht"
        Vapi::PlayHtVoice.validate_raw(obj: obj)
      when "rime-ai"
        Vapi::RimeAiVoice.validate_raw(obj: obj)
      when "smallest-ai"
        Vapi::SmallestAiVoice.validate_raw(obj: obj)
      when "tavus"
        Vapi::TavusVoice.validate_raw(obj: obj)
      when "vapi"
        Vapi::VapiVoice.validate_raw(obj: obj)
      when "sesame"
        Vapi::SesameVoice.validate_raw(obj: obj)
      when "inworld"
        Vapi::InworldVoice.validate_raw(obj: obj)
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
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.azure(member:)
      new(member: member, discriminant: "azure")
    end

    # @param member [Vapi::CartesiaVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.cartesia(member:)
      new(member: member, discriminant: "cartesia")
    end

    # @param member [Vapi::CustomVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.custom_voice(member:)
      new(member: member, discriminant: "custom-voice")
    end

    # @param member [Vapi::DeepgramVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end

    # @param member [Vapi::ElevenLabsVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self._11_labs(member:)
      new(member: member, discriminant: "11labs")
    end

    # @param member [Vapi::HumeVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.hume(member:)
      new(member: member, discriminant: "hume")
    end

    # @param member [Vapi::LmntVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.lmnt(member:)
      new(member: member, discriminant: "lmnt")
    end

    # @param member [Vapi::NeuphonicVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.neuphonic(member:)
      new(member: member, discriminant: "neuphonic")
    end

    # @param member [Vapi::OpenAiVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::PlayHtVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.playht(member:)
      new(member: member, discriminant: "playht")
    end

    # @param member [Vapi::RimeAiVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.rime_ai(member:)
      new(member: member, discriminant: "rime-ai")
    end

    # @param member [Vapi::SmallestAiVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.smallest_ai(member:)
      new(member: member, discriminant: "smallest-ai")
    end

    # @param member [Vapi::TavusVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.tavus(member:)
      new(member: member, discriminant: "tavus")
    end

    # @param member [Vapi::VapiVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.vapi(member:)
      new(member: member, discriminant: "vapi")
    end

    # @param member [Vapi::SesameVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.sesame(member:)
      new(member: member, discriminant: "sesame")
    end

    # @param member [Vapi::InworldVoice]
    # @return [Vapi::CreateWorkflowDtoVoice]
    def self.inworld(member:)
      new(member: member, discriminant: "inworld")
    end
  end
end
