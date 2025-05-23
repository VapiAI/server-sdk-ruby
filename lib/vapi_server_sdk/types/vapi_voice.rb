# frozen_string_literal: true

require_relative "vapi_voice_voice_id"
require_relative "vapi_voice_language"
require_relative "chunk_plan"
require_relative "fallback_plan"
require "ostruct"
require "json"

module Vapi
  class VapiVoice
    # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
    # @return [Vapi::VapiVoiceVoiceId] The voices provided by Vapi
    attr_reader :voice_id
    # @return [Float] This is the speed multiplier that will be used.
    #  @default 1
    attr_reader :speed
    # @return [Vapi::VapiVoiceLanguage] This is the language code (ISO 639-1) that will be used.
    #  @default 'en-US'
    attr_reader :language
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    attr_reader :fallback_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param caching_enabled [Boolean] This is the flag to toggle voice caching for the assistant.
    # @param voice_id [Vapi::VapiVoiceVoiceId] The voices provided by Vapi
    # @param speed [Float] This is the speed multiplier that will be used.
    #  @default 1
    # @param language [Vapi::VapiVoiceLanguage] This is the language code (ISO 639-1) that will be used.
    #  @default 'en-US'
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param fallback_plan [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VapiVoice]
    def initialize(voice_id:, caching_enabled: OMIT, speed: OMIT, language: OMIT, chunk_plan: OMIT,
                   fallback_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @speed = speed if speed != OMIT
      @language = language if language != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "cachingEnabled": caching_enabled,
        "voiceId": voice_id,
        "speed": speed,
        "language": language,
        "chunkPlan": chunk_plan,
        "fallbackPlan": fallback_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VapiVoice
    #
    # @param json_object [String]
    # @return [Vapi::VapiVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      voice_id = parsed_json["voiceId"]
      speed = parsed_json["speed"]
      language = parsed_json["language"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      if parsed_json["fallbackPlan"].nil?
        fallback_plan = nil
      else
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackPlan.from_json(json_object: fallback_plan)
      end
      new(
        caching_enabled: caching_enabled,
        voice_id: voice_id,
        speed: speed,
        language: language,
        chunk_plan: chunk_plan,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of VapiVoice to a JSON object
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
      obj.caching_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.caching_enabled is not the expected type, validation failed.")
      obj.voice_id.is_a?(Vapi::VapiVoiceVoiceId) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::VapiVoiceLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
      obj.fallback_plan.nil? || Vapi::FallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end
