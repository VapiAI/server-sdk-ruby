# frozen_string_literal: true
require_relative "cartesia_voice_model"
require_relative "cartesia_voice_language"
require_relative "cartesia_experimental_controls"
require_relative "chunk_plan"
require_relative "fallback_plan"
require "ostruct"
require "json"

module Vapi
  class CartesiaVoice
  # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
  # @return [String] The ID of the particular voice you want to use.
    attr_reader :voice_id
  # @return [Vapi::CartesiaVoiceModel] This is the model that will be used. This is optional and will default to the
#  correct model for the voiceId.
    attr_reader :model
  # @return [Vapi::CartesiaVoiceLanguage] This is the language that will be used. This is optional and will default to the
#  correct language for the voiceId.
    attr_reader :language
  # @return [Vapi::CartesiaExperimentalControls] Experimental controls for Cartesia voice generation
    attr_reader :experimental_controls
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
    # @param voice_id [String] The ID of the particular voice you want to use.
    # @param model [Vapi::CartesiaVoiceModel] This is the model that will be used. This is optional and will default to the
#  correct model for the voiceId.
    # @param language [Vapi::CartesiaVoiceLanguage] This is the language that will be used. This is optional and will default to the
#  correct language for the voiceId.
    # @param experimental_controls [Vapi::CartesiaExperimentalControls] Experimental controls for Cartesia voice generation
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
#  provider.
    # @param fallback_plan [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
#  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CartesiaVoice]
    def initialize(caching_enabled: OMIT, voice_id:, model: OMIT, language: OMIT, experimental_controls: OMIT, chunk_plan: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @model = model if model != OMIT
      @language = language if language != OMIT
      @experimental_controls = experimental_controls if experimental_controls != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cachingEnabled": caching_enabled, "voiceId": voice_id, "model": model, "language": language, "experimentalControls": experimental_controls, "chunkPlan": chunk_plan, "fallbackPlan": fallback_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CartesiaVoice
    #
    # @param json_object [String] 
    # @return [Vapi::CartesiaVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      voice_id = parsed_json["voiceId"]
      model = parsed_json["model"]
      language = parsed_json["language"]
      unless parsed_json["experimentalControls"].nil?
        experimental_controls = parsed_json["experimentalControls"].to_json
        experimental_controls = Vapi::CartesiaExperimentalControls.from_json(json_object: experimental_controls)
      else
        experimental_controls = nil
      end
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
        model: model,
        language: language,
        experimental_controls: experimental_controls,
        chunk_plan: chunk_plan,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of CartesiaVoice to a JSON object
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
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.model&.is_a?(Vapi::CartesiaVoiceModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::CartesiaVoiceLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.experimental_controls.nil? || Vapi::CartesiaExperimentalControls.validate_raw(obj: obj.experimental_controls)
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
      obj.fallback_plan.nil? || Vapi::FallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end