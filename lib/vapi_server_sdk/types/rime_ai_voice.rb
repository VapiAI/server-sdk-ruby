# frozen_string_literal: true

require_relative "rime_ai_voice_id"
require_relative "rime_ai_voice_model"
require_relative "chunk_plan"
require_relative "fallback_plan"
require "ostruct"
require "json"

module Vapi
  class RimeAiVoice
    # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
    # @return [Vapi::RimeAiVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
    # @return [Vapi::RimeAiVoiceModel] This is the model that will be used. Defaults to 'arcana' when not specified.
    attr_reader :model
    # @return [Float] This is the speed multiplier that will be used.
    attr_reader :speed
    # @return [Boolean] This is a flag that controls whether to add slight pauses using angle brackets.
    #  Example: "Hi. <200> I'd love to have a conversation with you." adds a 200ms
    #  pause between the first and second sentences.
    attr_reader :pause_between_brackets
    # @return [Boolean] This is a flag that controls whether text inside brackets should be phonemized
    #  (converted to phonetic pronunciation) - Example: "{h'El.o} World" will pronounce
    #  "Hello" as expected.
    attr_reader :phonemize_between_brackets
    # @return [Boolean] This is a flag that controls whether to optimize for reduced latency in
    #  streaming.
    #  https://docs.rime.ai/api-reference/endpoint/websockets#param-reduce-latency
    attr_reader :reduce_latency
    # @return [String] This is a string that allows inline speed control using alpha notation.
    #  https://docs.rime.ai/api-reference/endpoint/websockets#param-inline-speed-alpha
    attr_reader :inline_speed_alpha
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
    # @param voice_id [Vapi::RimeAiVoiceId] This is the provider-specific ID that will be used.
    # @param model [Vapi::RimeAiVoiceModel] This is the model that will be used. Defaults to 'arcana' when not specified.
    # @param speed [Float] This is the speed multiplier that will be used.
    # @param pause_between_brackets [Boolean] This is a flag that controls whether to add slight pauses using angle brackets.
    #  Example: "Hi. <200> I'd love to have a conversation with you." adds a 200ms
    #  pause between the first and second sentences.
    # @param phonemize_between_brackets [Boolean] This is a flag that controls whether text inside brackets should be phonemized
    #  (converted to phonetic pronunciation) - Example: "{h'El.o} World" will pronounce
    #  "Hello" as expected.
    # @param reduce_latency [Boolean] This is a flag that controls whether to optimize for reduced latency in
    #  streaming.
    #  https://docs.rime.ai/api-reference/endpoint/websockets#param-reduce-latency
    # @param inline_speed_alpha [String] This is a string that allows inline speed control using alpha notation.
    #  https://docs.rime.ai/api-reference/endpoint/websockets#param-inline-speed-alpha
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param fallback_plan [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RimeAiVoice]
    def initialize(voice_id:, caching_enabled: OMIT, model: OMIT, speed: OMIT, pause_between_brackets: OMIT,
                   phonemize_between_brackets: OMIT, reduce_latency: OMIT, inline_speed_alpha: OMIT, chunk_plan: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @model = model if model != OMIT
      @speed = speed if speed != OMIT
      @pause_between_brackets = pause_between_brackets if pause_between_brackets != OMIT
      @phonemize_between_brackets = phonemize_between_brackets if phonemize_between_brackets != OMIT
      @reduce_latency = reduce_latency if reduce_latency != OMIT
      @inline_speed_alpha = inline_speed_alpha if inline_speed_alpha != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "cachingEnabled": caching_enabled,
        "voiceId": voice_id,
        "model": model,
        "speed": speed,
        "pauseBetweenBrackets": pause_between_brackets,
        "phonemizeBetweenBrackets": phonemize_between_brackets,
        "reduceLatency": reduce_latency,
        "inlineSpeedAlpha": inline_speed_alpha,
        "chunkPlan": chunk_plan,
        "fallbackPlan": fallback_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RimeAiVoice
    #
    # @param json_object [String]
    # @return [Vapi::RimeAiVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::RimeAiVoiceId.from_json(json_object: voice_id)
      end
      model = parsed_json["model"]
      speed = parsed_json["speed"]
      pause_between_brackets = parsed_json["pauseBetweenBrackets"]
      phonemize_between_brackets = parsed_json["phonemizeBetweenBrackets"]
      reduce_latency = parsed_json["reduceLatency"]
      inline_speed_alpha = parsed_json["inlineSpeedAlpha"]
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
        speed: speed,
        pause_between_brackets: pause_between_brackets,
        phonemize_between_brackets: phonemize_between_brackets,
        reduce_latency: reduce_latency,
        inline_speed_alpha: inline_speed_alpha,
        chunk_plan: chunk_plan,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of RimeAiVoice to a JSON object
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
      Vapi::RimeAiVoiceId.validate_raw(obj: obj.voice_id)
      obj.model&.is_a?(Vapi::RimeAiVoiceModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.pause_between_brackets&.is_a?(Boolean) != false || raise("Passed value for field obj.pause_between_brackets is not the expected type, validation failed.")
      obj.phonemize_between_brackets&.is_a?(Boolean) != false || raise("Passed value for field obj.phonemize_between_brackets is not the expected type, validation failed.")
      obj.reduce_latency&.is_a?(Boolean) != false || raise("Passed value for field obj.reduce_latency is not the expected type, validation failed.")
      obj.inline_speed_alpha&.is_a?(String) != false || raise("Passed value for field obj.inline_speed_alpha is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
      obj.fallback_plan.nil? || Vapi::FallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end
