# frozen_string_literal: true

require_relative "azure_voice_id"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class AzureVoice
    # @return [Boolean] This determines whether fillers are injected into the model output before
    #  inputting it into the voice provider.
    #  Default `false` because you can achieve better results with prompting the model.
    attr_reader :filler_injection_enabled
    # @return [Vapi::AzureVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
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

    # @param filler_injection_enabled [Boolean] This determines whether fillers are injected into the model output before
    #  inputting it into the voice provider.
    #  Default `false` because you can achieve better results with prompting the model.
    # @param voice_id [Vapi::AzureVoiceId] This is the provider-specific ID that will be used.
    # @param speed [Float] This is the speed multiplier that will be used.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AzureVoice]
    def initialize(voice_id:, filler_injection_enabled: OMIT, speed: OMIT, chunk_plan: OMIT, additional_properties: nil)
      @filler_injection_enabled = filler_injection_enabled if filler_injection_enabled != OMIT
      @voice_id = voice_id
      @speed = speed if speed != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fillerInjectionEnabled": filler_injection_enabled,
        "voiceId": voice_id,
        "speed": speed,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AzureVoice
    #
    # @param json_object [String]
    # @return [Vapi::AzureVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      filler_injection_enabled = parsed_json["fillerInjectionEnabled"]
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::AzureVoiceId.from_json(json_object: voice_id)
      end
      speed = parsed_json["speed"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        filler_injection_enabled: filler_injection_enabled,
        voice_id: voice_id,
        speed: speed,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of AzureVoice to a JSON object
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
      obj.filler_injection_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.filler_injection_enabled is not the expected type, validation failed.")
      Vapi::AzureVoiceId.validate_raw(obj: obj.voice_id)
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
