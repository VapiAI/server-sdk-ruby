# frozen_string_literal: true

require_relative "deepgram_transcriber_model"
require_relative "deepgram_transcriber_language"
require "ostruct"
require "json"

module Vapi
  class DeepgramTranscriber
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
    # @return [Boolean] This enables or disables language detection. If true, swaps transcribers to
    #  detected language automatically. Defaults to false.
    attr_reader :language_detection_enabled
    # @return [Array<String>] These keywords are passed to the transcription model to help it pick up use-case
    #  specific words. Anything that may not be a common word, like your company name,
    #  should be added here.
    attr_reader :keywords
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
    # @param language_detection_enabled [Boolean] This enables or disables language detection. If true, swaps transcribers to
    #  detected language automatically. Defaults to false.
    # @param keywords [Array<String>] These keywords are passed to the transcription model to help it pick up use-case
    #  specific words. Anything that may not be a common word, like your company name,
    #  should be added here.
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
    # @return [Vapi::DeepgramTranscriber]
    def initialize(model: OMIT, language: OMIT, smart_format: OMIT, language_detection_enabled: OMIT, keywords: OMIT,
                   endpointing: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @language = language if language != OMIT
      @smart_format = smart_format if smart_format != OMIT
      @language_detection_enabled = language_detection_enabled if language_detection_enabled != OMIT
      @keywords = keywords if keywords != OMIT
      @endpointing = endpointing if endpointing != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "language": language,
        "smartFormat": smart_format,
        "languageDetectionEnabled": language_detection_enabled,
        "keywords": keywords,
        "endpointing": endpointing
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of DeepgramTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::DeepgramTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::DeepgramTranscriberModel.from_json(json_object: model)
      end
      language = parsed_json["language"]
      smart_format = parsed_json["smartFormat"]
      language_detection_enabled = parsed_json["languageDetectionEnabled"]
      keywords = parsed_json["keywords"]
      endpointing = parsed_json["endpointing"]
      new(
        model: model,
        language: language,
        smart_format: smart_format,
        language_detection_enabled: language_detection_enabled,
        keywords: keywords,
        endpointing: endpointing,
        additional_properties: struct
      )
    end

    # Serialize an instance of DeepgramTranscriber to a JSON object
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
      obj.model.nil? || Vapi::DeepgramTranscriberModel.validate_raw(obj: obj.model)
      obj.language&.is_a?(Vapi::DeepgramTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.smart_format&.is_a?(Boolean) != false || raise("Passed value for field obj.smart_format is not the expected type, validation failed.")
      obj.language_detection_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.language_detection_enabled is not the expected type, validation failed.")
      obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      obj.endpointing&.is_a?(Float) != false || raise("Passed value for field obj.endpointing is not the expected type, validation failed.")
    end
  end
end
