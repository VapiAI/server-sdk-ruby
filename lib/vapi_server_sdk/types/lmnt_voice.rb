# frozen_string_literal: true
require_relative "lmnt_voice_id"
require_relative "lmnt_voice_language"
require_relative "chunk_plan"
require_relative "fallback_plan"
require "ostruct"
require "json"

module Vapi
  class LmntVoice
  # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
  # @return [Vapi::LmntVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
  # @return [Float] This is the speed multiplier that will be used.
    attr_reader :speed
  # @return [Vapi::LmntVoiceLanguage] Two letter ISO 639-1 language code. Use "auto" for auto-detection.
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
    # @param voice_id [Vapi::LmntVoiceId] This is the provider-specific ID that will be used.
    # @param speed [Float] This is the speed multiplier that will be used.
    # @param language [Vapi::LmntVoiceLanguage] Two letter ISO 639-1 language code. Use "auto" for auto-detection.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
#  provider.
    # @param fallback_plan [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
#  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::LmntVoice]
    def initialize(caching_enabled: OMIT, voice_id:, speed: OMIT, language: OMIT, chunk_plan: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @speed = speed if speed != OMIT
      @language = language if language != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cachingEnabled": caching_enabled, "voiceId": voice_id, "speed": speed, "language": language, "chunkPlan": chunk_plan, "fallbackPlan": fallback_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LmntVoice
    #
    # @param json_object [String] 
    # @return [Vapi::LmntVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      unless parsed_json["voiceId"].nil?
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::LmntVoiceId.from_json(json_object: voice_id)
      else
        voice_id = nil
      end
      speed = parsed_json["speed"]
      language = parsed_json["language"]
      unless parsed_json["chunkPlan"].nil?
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      else
        chunk_plan = nil
      end
      unless parsed_json["fallbackPlan"].nil?
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackPlan.from_json(json_object: fallback_plan)
      else
        fallback_plan = nil
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
# Serialize an instance of LmntVoice to a JSON object
    #
    # @return [String]
    def to_json
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
      Vapi::LmntVoiceId.validate_raw(obj: obj.voice_id)
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::LmntVoiceLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
      obj.fallback_plan.nil? || Vapi::FallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end