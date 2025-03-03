# frozen_string_literal: true

require_relative "fallback_deepgram_voice_id"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackDeepgramVoice
    # @return [Vapi::FallbackDeepgramVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
    # @return [Boolean] If set to true, this will add mip_opt_out=true as a query parameter of all API
    #  requests. See
    #  gram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
    #  This will only be used if you are using your own Deepgram API key.
    #  @default false
    attr_reader :mip_opt_out
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_id [Vapi::FallbackDeepgramVoiceId] This is the provider-specific ID that will be used.
    # @param mip_opt_out [Boolean] If set to true, this will add mip_opt_out=true as a query parameter of all API
    #  requests. See
    #  gram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
    #  This will only be used if you are using your own Deepgram API key.
    #  @default false
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackDeepgramVoice]
    def initialize(voice_id:, mip_opt_out: OMIT, chunk_plan: OMIT, additional_properties: nil)
      @voice_id = voice_id
      @mip_opt_out = mip_opt_out if mip_opt_out != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "voiceId": voice_id, "mipOptOut": mip_opt_out, "chunkPlan": chunk_plan }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackDeepgramVoice
    #
    # @param json_object [String]
    # @return [Vapi::FallbackDeepgramVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::FallbackDeepgramVoiceId.from_json(json_object: voice_id)
      end
      mip_opt_out = parsed_json["mipOptOut"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        voice_id: voice_id,
        mip_opt_out: mip_opt_out,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackDeepgramVoice to a JSON object
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
      Vapi::FallbackDeepgramVoiceId.validate_raw(obj: obj.voice_id)
      obj.mip_opt_out&.is_a?(Boolean) != false || raise("Passed value for field obj.mip_opt_out is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
