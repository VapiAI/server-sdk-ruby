# frozen_string_literal: true

require_relative "fallback_inworld_voice_voice_id"
require_relative "fallback_inworld_voice_language_code"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackInworldVoice
    # @return [Boolean] This is the flag to toggle voice caching for the assistant.
    attr_reader :caching_enabled
    # @return [Vapi::FallbackInworldVoiceVoiceId] Available voices by language:
    #  • en: Alex, Ashley, Craig, Deborah, Dennis, Edward, Elizabeth, Hades, Julia,
    #  Pixie, Mark, Olivia, Priya, Ronald, Sarah, Shaun, Theodore, Timothy, Wendy,
    #  Dominus
    #  • zh: Yichen, Xiaoyin, Xinyi, Jing
    #  • nl: Erik, Katrien, Lennart, Lore
    #  • fr: Alain, Hélène, Mathieu, Étienne
    #  • de: Johanna, Josef
    #  • it: Gianni, Orietta
    #  • ja: Asuka, Satoshi
    #  • ko: Hyunwoo, Minji, Seojun, Yoona
    #  • pl: Szymon, Wojciech
    #  • pt: Heitor, Maitê
    #  • es: Diego, Lupita, Miguel, Rafael
    attr_reader :voice_id
    # @return [String] This is the model that will be used.
    attr_reader :model
    # @return [Vapi::FallbackInworldVoiceLanguageCode] Language code for Inworld TTS synthesis
    attr_reader :language_code
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
    # @param voice_id [Vapi::FallbackInworldVoiceVoiceId] Available voices by language:
    #  • en: Alex, Ashley, Craig, Deborah, Dennis, Edward, Elizabeth, Hades, Julia,
    #  Pixie, Mark, Olivia, Priya, Ronald, Sarah, Shaun, Theodore, Timothy, Wendy,
    #  Dominus
    #  • zh: Yichen, Xiaoyin, Xinyi, Jing
    #  • nl: Erik, Katrien, Lennart, Lore
    #  • fr: Alain, Hélène, Mathieu, Étienne
    #  • de: Johanna, Josef
    #  • it: Gianni, Orietta
    #  • ja: Asuka, Satoshi
    #  • ko: Hyunwoo, Minji, Seojun, Yoona
    #  • pl: Szymon, Wojciech
    #  • pt: Heitor, Maitê
    #  • es: Diego, Lupita, Miguel, Rafael
    # @param model [String] This is the model that will be used.
    # @param language_code [Vapi::FallbackInworldVoiceLanguageCode] Language code for Inworld TTS synthesis
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackInworldVoice]
    def initialize(voice_id:, caching_enabled: OMIT, model: OMIT, language_code: OMIT, chunk_plan: OMIT,
                   additional_properties: nil)
      @caching_enabled = caching_enabled if caching_enabled != OMIT
      @voice_id = voice_id
      @model = model if model != OMIT
      @language_code = language_code if language_code != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "cachingEnabled": caching_enabled,
        "voiceId": voice_id,
        "model": model,
        "languageCode": language_code,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackInworldVoice
    #
    # @param json_object [String]
    # @return [Vapi::FallbackInworldVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      caching_enabled = parsed_json["cachingEnabled"]
      voice_id = parsed_json["voiceId"]
      model = parsed_json["model"]
      language_code = parsed_json["languageCode"]
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
        language_code: language_code,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackInworldVoice to a JSON object
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
      obj.voice_id.is_a?(Vapi::FallbackInworldVoiceVoiceId) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language_code&.is_a?(Vapi::FallbackInworldVoiceLanguageCode) != false || raise("Passed value for field obj.language_code is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
