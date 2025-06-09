# frozen_string_literal: true
require_relative "fallback_neuphonic_voice_model"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackNeuphonicVoice
  # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
  # @return [String] This is the voice provider that will be used.
    attr_reader :provider
  # @return [String] This is the provider-specific ID that will be used.
    attr_reader :voice_id
  # @return [Vapi::FallbackNeuphonicVoiceModel] This is the model that will be used. Defaults to 'neu_fast' if not specified.
    attr_reader :model
  # @return [Hash{String => Object}] This is the language (ISO 639-1) that is enforced for the model.
    attr_reader :language
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
    # @param provider [String] This is the voice provider that will be used.
    # @param voice_id [String] This is the provider-specific ID that will be used.
    # @param model [Vapi::FallbackNeuphonicVoiceModel] This is the model that will be used. Defaults to 'neu_fast' if not specified.
    # @param language [Hash{String => Object}] This is the language (ISO 639-1) that is enforced for the model.
    # @param speed [Float] This is the speed multiplier that will be used.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
#  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackNeuphonicVoice]
    def initialize(caching_enabled: OMIT, provider:, voice_id:, model: OMIT, language:, speed: OMIT, chunk_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @provider = provider
      @voice_id = voice_id
      @model = model if model != OMIT
      @language = language
      @speed = speed if speed != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cachingEnabled": caching_enabled, "provider": provider, "voiceId": voice_id, "model": model, "language": language, "speed": speed, "chunkPlan": chunk_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FallbackNeuphonicVoice
    #
    # @param json_object [String] 
    # @return [Vapi::FallbackNeuphonicVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      provider = parsed_json["provider"]
      voice_id = parsed_json["voiceId"]
      model = parsed_json["model"]
      language = parsed_json["language"]
      speed = parsed_json["speed"]
      unless parsed_json["chunkPlan"].nil?
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      else
        chunk_plan = nil
      end
      new(
        caching_enabled: caching_enabled,
        provider: provider,
        voice_id: voice_id,
        model: model,
        language: language,
        speed: speed,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of FallbackNeuphonicVoice to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.model&.is_a?(Vapi::FallbackNeuphonicVoiceModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language.is_a?(Hash) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end