# frozen_string_literal: true

require_relative "deepgram_transcriber_model"
require_relative "deepgram_transcriber_language"
require "ostruct"
require "json"

module Vapi
  class FallbackDeepgramTranscriber
    # @return [Vapi::DeepgramTranscriberModel] This is the Deepgram model that will be used. A list of models can be found
    #  here: https://developers.deepgram.com/docs/models-languages-overview
    attr_reader :model
    # @return [Vapi::DeepgramTranscriberLanguage] This is the language that will be set for the transcription. The list of
    #  languages Deepgram supports can be found here:
    #  https://developers.deepgram.com/docs/models-languages-overview
    attr_reader :language
    # @return [Boolean] This will be use smart format option provided by Deepgram. It's default disabled
    #  because it can sometimes format numbers as times but it's getting better.
    attr_reader :smart_format
    # @return [Boolean] If set to true, this will add mip_opt_out=true as a query parameter of all API
    #  requests. See
    #  gram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
    #  This will only be used if you are using your own Deepgram API key.
    #  @default false
    attr_reader :mip_opt_out
    # @return [Boolean] If set to true, this will cause deepgram to convert spoken numbers to literal
    #  numerals. For example, "my phone number is nine-seven-two..." would become "my
    #  phone number is 972..."
    #  @default false
    attr_reader :numerals
    # @return [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    attr_reader :confidence_threshold
    # @return [Float] Eager end-of-turn confidence required to fire a eager end-of-turn event. Setting
    #  a value here will enable EagerEndOfTurn and SpeechResumed events. It is disabled
    #  by default. Only used with Flux models.
    attr_reader :eager_eot_threshold
    # @return [Float] End-of-turn confidence required to finish a turn. Only used with Flux models.
    #  @default 0.7
    attr_reader :eot_threshold
    # @return [Float] A turn will be finished when this much time has passed after speech, regardless
    #  of EOT confidence. Only used with Flux models.
    #  @default 5000
    attr_reader :eot_timeout_ms
    # @return [Array<String>] These keywords are passed to the transcription model to help it pick up use-case
    #  specific words. Anything that may not be a common word, like your company name,
    #  should be added here.
    attr_reader :keywords
    # @return [Array<String>] Keyterm Prompting allows you improve Keyword Recall Rate (KRR) for important
    #  keyterms or phrases up to 90%.
    attr_reader :keyterm
    # @return [Float] This is the timeout after which Deepgram will send transcription on user
    #  silence. You can read in-depth documentation here:
    #  https://developers.deepgram.com/docs/endpointing.
    #  Here are the most important bits:
    #  - Defaults to 10. This is recommended for most use cases to optimize for
    #  latency.
    #  - 10 can cause some missing transcriptions since because of the shorter context.
    #  This mostly happens for one-word utterances. For those uses cases, it's
    #  recommended to try 300. It will add a bit of latency but the quality and
    #  reliability of the experience will be better.
    #  - If neither 10 nor 300 work, contact support@vapi.ai and we'll find another
    #  solution.
    #  @default 10
    attr_reader :endpointing
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::DeepgramTranscriberModel] This is the Deepgram model that will be used. A list of models can be found
    #  here: https://developers.deepgram.com/docs/models-languages-overview
    # @param language [Vapi::DeepgramTranscriberLanguage] This is the language that will be set for the transcription. The list of
    #  languages Deepgram supports can be found here:
    #  https://developers.deepgram.com/docs/models-languages-overview
    # @param smart_format [Boolean] This will be use smart format option provided by Deepgram. It's default disabled
    #  because it can sometimes format numbers as times but it's getting better.
    # @param mip_opt_out [Boolean] If set to true, this will add mip_opt_out=true as a query parameter of all API
    #  requests. See
    #  gram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
    #  This will only be used if you are using your own Deepgram API key.
    #  @default false
    # @param numerals [Boolean] If set to true, this will cause deepgram to convert spoken numbers to literal
    #  numerals. For example, "my phone number is nine-seven-two..." would become "my
    #  phone number is 972..."
    #  @default false
    # @param confidence_threshold [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    # @param eager_eot_threshold [Float] Eager end-of-turn confidence required to fire a eager end-of-turn event. Setting
    #  a value here will enable EagerEndOfTurn and SpeechResumed events. It is disabled
    #  by default. Only used with Flux models.
    # @param eot_threshold [Float] End-of-turn confidence required to finish a turn. Only used with Flux models.
    #  @default 0.7
    # @param eot_timeout_ms [Float] A turn will be finished when this much time has passed after speech, regardless
    #  of EOT confidence. Only used with Flux models.
    #  @default 5000
    # @param keywords [Array<String>] These keywords are passed to the transcription model to help it pick up use-case
    #  specific words. Anything that may not be a common word, like your company name,
    #  should be added here.
    # @param keyterm [Array<String>] Keyterm Prompting allows you improve Keyword Recall Rate (KRR) for important
    #  keyterms or phrases up to 90%.
    # @param endpointing [Float] This is the timeout after which Deepgram will send transcription on user
    #  silence. You can read in-depth documentation here:
    #  https://developers.deepgram.com/docs/endpointing.
    #  Here are the most important bits:
    #  - Defaults to 10. This is recommended for most use cases to optimize for
    #  latency.
    #  - 10 can cause some missing transcriptions since because of the shorter context.
    #  This mostly happens for one-word utterances. For those uses cases, it's
    #  recommended to try 300. It will add a bit of latency but the quality and
    #  reliability of the experience will be better.
    #  - If neither 10 nor 300 work, contact support@vapi.ai and we'll find another
    #  solution.
    #  @default 10
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackDeepgramTranscriber]
    def initialize(model: OMIT, language: OMIT, smart_format: OMIT, mip_opt_out: OMIT, numerals: OMIT,
                   confidence_threshold: OMIT, eager_eot_threshold: OMIT, eot_threshold: OMIT, eot_timeout_ms: OMIT, keywords: OMIT, keyterm: OMIT, endpointing: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @language = language if language != OMIT
      @smart_format = smart_format if smart_format != OMIT
      @mip_opt_out = mip_opt_out if mip_opt_out != OMIT
      @numerals = numerals if numerals != OMIT
      @confidence_threshold = confidence_threshold if confidence_threshold != OMIT
      @eager_eot_threshold = eager_eot_threshold if eager_eot_threshold != OMIT
      @eot_threshold = eot_threshold if eot_threshold != OMIT
      @eot_timeout_ms = eot_timeout_ms if eot_timeout_ms != OMIT
      @keywords = keywords if keywords != OMIT
      @keyterm = keyterm if keyterm != OMIT
      @endpointing = endpointing if endpointing != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "language": language,
        "smartFormat": smart_format,
        "mipOptOut": mip_opt_out,
        "numerals": numerals,
        "confidenceThreshold": confidence_threshold,
        "eagerEotThreshold": eager_eot_threshold,
        "eotThreshold": eot_threshold,
        "eotTimeoutMs": eot_timeout_ms,
        "keywords": keywords,
        "keyterm": keyterm,
        "endpointing": endpointing
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackDeepgramTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::FallbackDeepgramTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      language = parsed_json["language"]
      smart_format = parsed_json["smartFormat"]
      mip_opt_out = parsed_json["mipOptOut"]
      numerals = parsed_json["numerals"]
      confidence_threshold = parsed_json["confidenceThreshold"]
      eager_eot_threshold = parsed_json["eagerEotThreshold"]
      eot_threshold = parsed_json["eotThreshold"]
      eot_timeout_ms = parsed_json["eotTimeoutMs"]
      keywords = parsed_json["keywords"]
      keyterm = parsed_json["keyterm"]
      endpointing = parsed_json["endpointing"]
      new(
        model: model,
        language: language,
        smart_format: smart_format,
        mip_opt_out: mip_opt_out,
        numerals: numerals,
        confidence_threshold: confidence_threshold,
        eager_eot_threshold: eager_eot_threshold,
        eot_threshold: eot_threshold,
        eot_timeout_ms: eot_timeout_ms,
        keywords: keywords,
        keyterm: keyterm,
        endpointing: endpointing,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackDeepgramTranscriber to a JSON object
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
      obj.model&.is_a?(Vapi::DeepgramTranscriberModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::DeepgramTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.smart_format&.is_a?(Boolean) != false || raise("Passed value for field obj.smart_format is not the expected type, validation failed.")
      obj.mip_opt_out&.is_a?(Boolean) != false || raise("Passed value for field obj.mip_opt_out is not the expected type, validation failed.")
      obj.numerals&.is_a?(Boolean) != false || raise("Passed value for field obj.numerals is not the expected type, validation failed.")
      obj.confidence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.confidence_threshold is not the expected type, validation failed.")
      obj.eager_eot_threshold&.is_a?(Float) != false || raise("Passed value for field obj.eager_eot_threshold is not the expected type, validation failed.")
      obj.eot_threshold&.is_a?(Float) != false || raise("Passed value for field obj.eot_threshold is not the expected type, validation failed.")
      obj.eot_timeout_ms&.is_a?(Float) != false || raise("Passed value for field obj.eot_timeout_ms is not the expected type, validation failed.")
      obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      obj.keyterm&.is_a?(Array) != false || raise("Passed value for field obj.keyterm is not the expected type, validation failed.")
      obj.endpointing&.is_a?(Float) != false || raise("Passed value for field obj.endpointing is not the expected type, validation failed.")
    end
  end
end
