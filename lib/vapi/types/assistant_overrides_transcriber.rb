# frozen_string_literal: true

require "json"
require_relative "deepgram_transcriber"
require_relative "gladia_transcriber"
require_relative "talkscriber_transcriber"

module Vapi
  # These are the options for the assistant's transcriber.
  class AssistantOverridesTranscriber
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::AssistantOverridesTranscriber]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of AssistantOverridesTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::AssistantOverridesTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "deepgram"
                 Vapi::DeepgramTranscriber.from_json(json_object: json_object)
               when "gladia"
                 Vapi::GladiaTranscriber.from_json(json_object: json_object)
               when "talkscriber"
                 Vapi::TalkscriberTranscriber.from_json(json_object: json_object)
               else
                 Vapi::DeepgramTranscriber.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.provider)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "deepgram"
        { **@member.to_json, provider: @discriminant }.to_json
      when "gladia"
        { **@member.to_json, provider: @discriminant }.to_json
      when "talkscriber"
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
      when "deepgram"
        Vapi::DeepgramTranscriber.validate_raw(obj: obj)
      when "gladia"
        Vapi::GladiaTranscriber.validate_raw(obj: obj)
      when "talkscriber"
        Vapi::TalkscriberTranscriber.validate_raw(obj: obj)
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

    # @param member [Vapi::DeepgramTranscriber]
    # @return [Vapi::AssistantOverridesTranscriber]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end

    # @param member [Vapi::GladiaTranscriber]
    # @return [Vapi::AssistantOverridesTranscriber]
    def self.gladia(member:)
      new(member: member, discriminant: "gladia")
    end

    # @param member [Vapi::TalkscriberTranscriber]
    # @return [Vapi::AssistantOverridesTranscriber]
    def self.talkscriber(member:)
      new(member: member, discriminant: "talkscriber")
    end
  end
end
