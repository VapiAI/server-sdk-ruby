# frozen_string_literal: true

require_relative "fallback_eleven_labs_voice_id"
require_relative "fallback_eleven_labs_voice_model"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackElevenLabsVoice
    # @return [Vapi::FallbackElevenLabsVoiceId] This is the provider-specific ID that will be used. Ensure the Voice is present
    #  in your 11Labs Voice Library.
    attr_reader :voice_id
    # @return [Float] Defines the stability for voice settings.
    attr_reader :stability
    # @return [Float] Defines the similarity boost for voice settings.
    attr_reader :similarity_boost
    # @return [Float] Defines the style for voice settings.
    attr_reader :style
    # @return [Boolean] Defines the use speaker boost for voice settings.
    attr_reader :use_speaker_boost
    # @return [Float] Defines the optimize streaming latency for voice settings. Defaults to 3.
    attr_reader :optimize_streaming_latency
    # @return [Boolean] This enables the use of
    #  https://elevenlabs.io/docs/speech-synthesis/prompting#pronunciation. Defaults to
    #  false to save latency.
    #  @default false
    attr_reader :enable_ssml_parsing
    # @return [Vapi::FallbackElevenLabsVoiceModel] This is the model that will be used. Defaults to 'eleven_turbo_v2' if not
    #  specified.
    attr_reader :model
    # @return [String] This is the language (ISO 639-1) that is enforced for the model. Currently only
    #  Turbo v2.5 supports language enforcement. For other models, an error will be
    #  returned if language code is provided.
    attr_reader :language
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_id [Vapi::FallbackElevenLabsVoiceId] This is the provider-specific ID that will be used. Ensure the Voice is present
    #  in your 11Labs Voice Library.
    # @param stability [Float] Defines the stability for voice settings.
    # @param similarity_boost [Float] Defines the similarity boost for voice settings.
    # @param style [Float] Defines the style for voice settings.
    # @param use_speaker_boost [Boolean] Defines the use speaker boost for voice settings.
    # @param optimize_streaming_latency [Float] Defines the optimize streaming latency for voice settings. Defaults to 3.
    # @param enable_ssml_parsing [Boolean] This enables the use of
    #  https://elevenlabs.io/docs/speech-synthesis/prompting#pronunciation. Defaults to
    #  false to save latency.
    #  @default false
    # @param model [Vapi::FallbackElevenLabsVoiceModel] This is the model that will be used. Defaults to 'eleven_turbo_v2' if not
    #  specified.
    # @param language [String] This is the language (ISO 639-1) that is enforced for the model. Currently only
    #  Turbo v2.5 supports language enforcement. For other models, an error will be
    #  returned if language code is provided.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackElevenLabsVoice]
    def initialize(voice_id:, stability: OMIT, similarity_boost: OMIT, style: OMIT, use_speaker_boost: OMIT,
                   optimize_streaming_latency: OMIT, enable_ssml_parsing: OMIT, model: OMIT, language: OMIT, chunk_plan: OMIT, additional_properties: nil)
      @voice_id = voice_id
      @stability = stability if stability != OMIT
      @similarity_boost = similarity_boost if similarity_boost != OMIT
      @style = style if style != OMIT
      @use_speaker_boost = use_speaker_boost if use_speaker_boost != OMIT
      @optimize_streaming_latency = optimize_streaming_latency if optimize_streaming_latency != OMIT
      @enable_ssml_parsing = enable_ssml_parsing if enable_ssml_parsing != OMIT
      @model = model if model != OMIT
      @language = language if language != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "voiceId": voice_id,
        "stability": stability,
        "similarityBoost": similarity_boost,
        "style": style,
        "useSpeakerBoost": use_speaker_boost,
        "optimizeStreamingLatency": optimize_streaming_latency,
        "enableSsmlParsing": enable_ssml_parsing,
        "model": model,
        "language": language,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackElevenLabsVoice
    #
    # @param json_object [String]
    # @return [Vapi::FallbackElevenLabsVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::FallbackElevenLabsVoiceId.from_json(json_object: voice_id)
      end
      stability = parsed_json["stability"]
      similarity_boost = parsed_json["similarityBoost"]
      style = parsed_json["style"]
      use_speaker_boost = parsed_json["useSpeakerBoost"]
      optimize_streaming_latency = parsed_json["optimizeStreamingLatency"]
      enable_ssml_parsing = parsed_json["enableSsmlParsing"]
      model = parsed_json["model"]
      language = parsed_json["language"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        voice_id: voice_id,
        stability: stability,
        similarity_boost: similarity_boost,
        style: style,
        use_speaker_boost: use_speaker_boost,
        optimize_streaming_latency: optimize_streaming_latency,
        enable_ssml_parsing: enable_ssml_parsing,
        model: model,
        language: language,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackElevenLabsVoice to a JSON object
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
      Vapi::FallbackElevenLabsVoiceId.validate_raw(obj: obj.voice_id)
      obj.stability&.is_a?(Float) != false || raise("Passed value for field obj.stability is not the expected type, validation failed.")
      obj.similarity_boost&.is_a?(Float) != false || raise("Passed value for field obj.similarity_boost is not the expected type, validation failed.")
      obj.style&.is_a?(Float) != false || raise("Passed value for field obj.style is not the expected type, validation failed.")
      obj.use_speaker_boost&.is_a?(Boolean) != false || raise("Passed value for field obj.use_speaker_boost is not the expected type, validation failed.")
      obj.optimize_streaming_latency&.is_a?(Float) != false || raise("Passed value for field obj.optimize_streaming_latency is not the expected type, validation failed.")
      obj.enable_ssml_parsing&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_ssml_parsing is not the expected type, validation failed.")
      obj.model&.is_a?(Vapi::FallbackElevenLabsVoiceModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
