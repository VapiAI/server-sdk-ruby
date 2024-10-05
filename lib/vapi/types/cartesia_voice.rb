# frozen_string_literal: true

require_relative "cartesia_voice_model"
require_relative "cartesia_voice_language"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class CartesiaVoice
    # @return [Boolean] This determines whether fillers are injected into the model output before
    #  inputting it into the voice provider.
    #  Default `false` because you can achieve better results with prompting the model.
    attr_reader :filler_injection_enabled
    # @return [String] This is the voice provider that will be used.
    attr_reader :provider
    # @return [Vapi::CartesiaVoiceModel] This is the model that will be used. This is optional and will default to the
    #  correct model for the voiceId.
    attr_reader :model
    # @return [Vapi::CartesiaVoiceLanguage] This is the language that will be used. This is optional and will default to the
    #  correct language for the voiceId.
    attr_reader :language
    # @return [String] This is the provider-specific ID that will be used.
    attr_reader :voice_id
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
    # @param provider [String] This is the voice provider that will be used.
    # @param model [Vapi::CartesiaVoiceModel] This is the model that will be used. This is optional and will default to the
    #  correct model for the voiceId.
    # @param language [Vapi::CartesiaVoiceLanguage] This is the language that will be used. This is optional and will default to the
    #  correct language for the voiceId.
    # @param voice_id [String] This is the provider-specific ID that will be used.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CartesiaVoice]
    def initialize(provider:, voice_id:, filler_injection_enabled: OMIT, model: OMIT, language: OMIT, chunk_plan: OMIT,
                   additional_properties: nil)
      @filler_injection_enabled = filler_injection_enabled if filler_injection_enabled != OMIT
      @provider = provider
      @model = model if model != OMIT
      @language = language if language != OMIT
      @voice_id = voice_id
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fillerInjectionEnabled": filler_injection_enabled,
        "provider": provider,
        "model": model,
        "language": language,
        "voiceId": voice_id,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
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
      filler_injection_enabled = parsed_json["fillerInjectionEnabled"]
      provider = parsed_json["provider"]
      model = parsed_json["model"]
      language = parsed_json["language"]
      voice_id = parsed_json["voiceId"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        filler_injection_enabled: filler_injection_enabled,
        provider: provider,
        model: model,
        language: language,
        voice_id: voice_id,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of CartesiaVoice to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.model&.is_a?(Vapi::CartesiaVoiceModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::CartesiaVoiceLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
