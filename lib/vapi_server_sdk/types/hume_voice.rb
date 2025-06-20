# frozen_string_literal: true
require_relative "chunk_plan"
require_relative "fallback_plan"
require "ostruct"
require "json"

module Vapi
  class HumeVoice
  # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
  # @return [String] This is the model that will be used.
    attr_reader :model
  # @return [String] The ID of the particular voice you want to use.
    attr_reader :voice_id
  # @return [Boolean] Indicates whether the chosen voice is a preset Hume AI voice or a custom voice.
    attr_reader :is_custom_hume_voice
  # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
#  provider.
    attr_reader :chunk_plan
  # @return [String] Natural language instructions describing how the synthesized speech should
#  sound, including but not limited to tone, intonation, pacing, and accent (e.g.,
#  'a soft, gentle voice with a strong British accent').
#  If a Voice is specified in the request, this description serves as acting
#  instructions.
#  If no Voice is specified, a new voice is generated based on this description.
    attr_reader :description
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
    # @param model [String] This is the model that will be used.
    # @param voice_id [String] The ID of the particular voice you want to use.
    # @param is_custom_hume_voice [Boolean] Indicates whether the chosen voice is a preset Hume AI voice or a custom voice.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
#  provider.
    # @param description [String] Natural language instructions describing how the synthesized speech should
#  sound, including but not limited to tone, intonation, pacing, and accent (e.g.,
#  'a soft, gentle voice with a strong British accent').
#  If a Voice is specified in the request, this description serves as acting
#  instructions.
#  If no Voice is specified, a new voice is generated based on this description.
    # @param fallback_plan [Vapi::FallbackPlan] This is the plan for voice provider fallbacks in the event that the primary
#  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::HumeVoice]
    def initialize(caching_enabled: OMIT, model: OMIT, voice_id:, is_custom_hume_voice: OMIT, chunk_plan: OMIT, description: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @model = model if model != OMIT
      @voice_id = voice_id
      @is_custom_hume_voice = is_custom_hume_voice if is_custom_hume_voice != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @description = description if description != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cachingEnabled": caching_enabled, "model": model, "voiceId": voice_id, "isCustomHumeVoice": is_custom_hume_voice, "chunkPlan": chunk_plan, "description": description, "fallbackPlan": fallback_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of HumeVoice
    #
    # @param json_object [String] 
    # @return [Vapi::HumeVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      model = parsed_json["model"]
      voice_id = parsed_json["voiceId"]
      is_custom_hume_voice = parsed_json["isCustomHumeVoice"]
      unless parsed_json["chunkPlan"].nil?
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      else
        chunk_plan = nil
      end
      description = parsed_json["description"]
      unless parsed_json["fallbackPlan"].nil?
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackPlan.from_json(json_object: fallback_plan)
      else
        fallback_plan = nil
      end
      new(
        caching_enabled: caching_enabled,
        model: model,
        voice_id: voice_id,
        is_custom_hume_voice: is_custom_hume_voice,
        chunk_plan: chunk_plan,
        description: description,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of HumeVoice to a JSON object
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
      obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.is_custom_hume_voice&.is_a?(Boolean) != false || raise("Passed value for field obj.is_custom_hume_voice is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.fallback_plan.nil? || Vapi::FallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end