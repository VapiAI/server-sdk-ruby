# frozen_string_literal: true

require_relative "fallback_smallest_ai_voice_id"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackSmallestAiVoice
    # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
    # @return [Vapi::FallbackSmallestAiVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
    # @return [String] Smallest AI voice model to use. Defaults to 'lightning' when not specified.
    attr_reader :model
    # @return [Float] This is the speed multiplier that will be used.
    attr_reader :speed
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param caching_enabled [Boolean] This is the flag to toggle voice caching for the assistant.
    # @param voice_id [Vapi::FallbackSmallestAiVoiceId] This is the provider-specific ID that will be used.
    # @param model [String] Smallest AI voice model to use. Defaults to 'lightning' when not specified.
    # @param speed [Float] This is the speed multiplier that will be used.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackSmallestAiVoice]
    def initialize(voice_id:, caching_enabled: OMIT, model: OMIT, speed: OMIT, chunk_plan: OMIT,
                   additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @model = model if model != OMIT
      @speed = speed if speed != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "cachingEnabled": caching_enabled,
        "voiceId": voice_id,
        "model": model,
        "speed": speed,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackSmallestAiVoice
    #
    # @param json_object [String]
    # @return [Vapi::FallbackSmallestAiVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::FallbackSmallestAiVoiceId.from_json(json_object: voice_id)
      end
      model = parsed_json["model"]
      speed = parsed_json["speed"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        caching_enabled: caching_enabled,
        voice_id: voice_id,
        model: model,
        speed: speed,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackSmallestAiVoice to a JSON object
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
      Vapi::FallbackSmallestAiVoiceId.validate_raw(obj: obj.voice_id)
      obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
