# frozen_string_literal: true

require_relative "minimax_voice_model"
require_relative "minimax_voice_region"
require_relative "minimax_voice_language_boost"
require_relative "chunk_plan"
require_relative "fallback_plan"
require "ostruct"
require "json"

module Vapi
  class MinimaxVoice
    # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
    # @return [String] This is the provider-specific ID that will be used. Use a voice from
    #  MINIMAX_PREDEFINED_VOICES or a custom cloned voice ID.
    attr_reader :voice_id
    # @return [Vapi::MinimaxVoiceModel] This is the model that will be used. Options are 'speech-02-hd' and
    #  'speech-02-turbo'.
    #  speech-02-hd is optimized for high-fidelity applications like voiceovers and
    #  audiobooks.
    #  speech-02-turbo is designed for real-time applications with low latency.
    #  @default "speech-02-turbo"
    attr_reader :model
    # @return [String] The emotion to use for the voice. If not provided, will use auto-detect mode.
    #  Options include: 'happy', 'sad', 'angry', 'fearful', 'surprised', 'disgusted',
    #  'neutral'
    attr_reader :emotion
    # @return [Float] Voice pitch adjustment. Range from -12 to 12 semitones.
    #  @default 0
    attr_reader :pitch
    # @return [Float] Voice speed adjustment. Range from 0.5 to 2.0.
    #  @default 1.0
    attr_reader :speed
    # @return [Float] Voice volume adjustment. Range from 0.5 to 2.0.
    #  @default 1.0
    attr_reader :volume
    # @return [Vapi::MinimaxVoiceRegion] The region for Minimax API. Defaults to "worldwide".
    attr_reader :region
    # @return [Vapi::MinimaxVoiceLanguageBoost] Language hint for MiniMax T2A. Example: yue (Cantonese), zh (Chinese), en
    #  (English).
    attr_reader :language_boost
    # @return [Boolean] Enable MiniMax text normalization to improve number reading and formatting.
    attr_reader :text_normalization_enabled
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
    # @param voice_id [String] This is the provider-specific ID that will be used. Use a voice from
    #  MINIMAX_PREDEFINED_VOICES or a custom cloned voice ID.
    # @param model [Vapi::MinimaxVoiceModel] This is the model that will be used. Options are 'speech-02-hd' and
    #  'speech-02-turbo'.
    #  speech-02-hd is optimized for high-fidelity applications like voiceovers and
    #  audiobooks.
    #  speech-02-turbo is designed for real-time applications with low latency.
    #  @default "speech-02-turbo"
    # @param emotion [String] The emotion to use for the voice. If not provided, will use auto-detect mode.
    #  Options include: 'happy', 'sad', 'angry', 'fearful', 'surprised', 'disgusted',
    #  'neutral'
    # @param pitch [Float] Voice pitch adjustment. Range from -12 to 12 semitones.
    #  @default 0
    # @param speed [Float] Voice speed adjustment. Range from 0.5 to 2.0.
    #  @default 1.0
    # @param volume [Float] Voice volume adjustment. Range from 0.5 to 2.0.
    #  @default 1.0
    # @param region [Vapi::MinimaxVoiceRegion] The region for Minimax API. Defaults to "worldwide".
    # @param language_boost [Vapi::MinimaxVoiceLanguageBoost] Language hint for MiniMax T2A. Example: yue (Cantonese), zh (Chinese), en
    #  (English).
    # @param text_normalization_enabled [Boolean] Enable MiniMax text normalization to improve number reading and formatting.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param fallback_plan [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::MinimaxVoice]
    def initialize(voice_id:, caching_enabled: OMIT, model: OMIT, emotion: OMIT, pitch: OMIT, speed: OMIT,
                   volume: OMIT, region: OMIT, language_boost: OMIT, text_normalization_enabled: OMIT, chunk_plan: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @model = model if model != OMIT
      @emotion = emotion if emotion != OMIT
      @pitch = pitch if pitch != OMIT
      @speed = speed if speed != OMIT
      @volume = volume if volume != OMIT
      @region = region if region != OMIT
      @language_boost = language_boost if language_boost != OMIT
      @text_normalization_enabled = text_normalization_enabled if text_normalization_enabled != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "cachingEnabled": caching_enabled,
        "voiceId": voice_id,
        "model": model,
        "emotion": emotion,
        "pitch": pitch,
        "speed": speed,
        "volume": volume,
        "region": region,
        "languageBoost": language_boost,
        "textNormalizationEnabled": text_normalization_enabled,
        "chunkPlan": chunk_plan,
        "fallbackPlan": fallback_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MinimaxVoice
    #
    # @param json_object [String]
    # @return [Vapi::MinimaxVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      voice_id = parsed_json["voiceId"]
      model = parsed_json["model"]
      emotion = parsed_json["emotion"]
      pitch = parsed_json["pitch"]
      speed = parsed_json["speed"]
      volume = parsed_json["volume"]
      region = parsed_json["region"]
      language_boost = parsed_json["languageBoost"]
      text_normalization_enabled = parsed_json["textNormalizationEnabled"]
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
        model: model,
        emotion: emotion,
        pitch: pitch,
        speed: speed,
        volume: volume,
        region: region,
        language_boost: language_boost,
        text_normalization_enabled: text_normalization_enabled,
        chunk_plan: chunk_plan,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of MinimaxVoice to a JSON object
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
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.model&.is_a?(Vapi::MinimaxVoiceModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.emotion&.is_a?(String) != false || raise("Passed value for field obj.emotion is not the expected type, validation failed.")
      obj.pitch&.is_a?(Float) != false || raise("Passed value for field obj.pitch is not the expected type, validation failed.")
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.volume&.is_a?(Float) != false || raise("Passed value for field obj.volume is not the expected type, validation failed.")
      obj.region&.is_a?(Vapi::MinimaxVoiceRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.language_boost&.is_a?(Vapi::MinimaxVoiceLanguageBoost) != false || raise("Passed value for field obj.language_boost is not the expected type, validation failed.")
      obj.text_normalization_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.text_normalization_enabled is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
      obj.fallback_plan.nil? || Vapi::FallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end
