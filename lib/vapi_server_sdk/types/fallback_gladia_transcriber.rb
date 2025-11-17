# frozen_string_literal: true

require_relative "fallback_gladia_transcriber_model"
require_relative "fallback_gladia_transcriber_language_behaviour"
require_relative "fallback_gladia_transcriber_language"
require_relative "fallback_gladia_transcriber_languages"
require_relative "gladia_custom_vocabulary_config_dto"
require_relative "fallback_gladia_transcriber_region"
require "ostruct"
require "json"

module Vapi
  class FallbackGladiaTranscriber
    # @return [Vapi::FallbackGladiaTranscriberModel] This is the Gladia model that will be used. Default is 'fast'
    attr_reader :model
    # @return [Vapi::FallbackGladiaTranscriberLanguageBehaviour] Defines how the transcription model detects the audio language. Default value is
    #  'automatic single language'.
    attr_reader :language_behaviour
    # @return [Vapi::FallbackGladiaTranscriberLanguage] Defines the language to use for the transcription. Required when
    #  languageBehaviour is 'manual'.
    attr_reader :language
    # @return [Vapi::FallbackGladiaTranscriberLanguages] Defines the languages to use for the transcription. Required when
    #  languageBehaviour is 'manual'.
    attr_reader :languages
    # @return [String] Provides a custom vocabulary to the model to improve accuracy of transcribing
    #  context specific words, technical terms, names, etc. If empty, this argument is
    #  ignored.
    #  ⚠️ Warning ⚠️: Please be aware that the transcription_hint field has a character
    #  limit of 600. If you provide a transcription_hint longer than 600 characters, it
    #  will be automatically truncated to meet this limit.
    attr_reader :transcription_hint
    # @return [Boolean] If prosody is true, you will get a transcription that can contain prosodies i.e.
    #  (laugh) (giggles) (malefic laugh) (toss) (music)… Default value is false.
    attr_reader :prosody
    # @return [Boolean] If true, audio will be pre-processed to improve accuracy but latency will
    #  increase. Default value is false.
    attr_reader :audio_enhancer
    # @return [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    attr_reader :confidence_threshold
    # @return [Float] Endpointing time in seconds - time to wait before considering speech ended
    attr_reader :endpointing
    # @return [Float] Speech threshold - sensitivity configuration for speech detection (0.0 to 1.0)
    attr_reader :speech_threshold
    # @return [Boolean] Enable custom vocabulary for improved accuracy
    attr_reader :custom_vocabulary_enabled
    # @return [Vapi::GladiaCustomVocabularyConfigDto] Custom vocabulary configuration
    attr_reader :custom_vocabulary_config
    # @return [Vapi::FallbackGladiaTranscriberRegion] Region for processing audio (us-west or eu-west)
    attr_reader :region
    # @return [Boolean] Enable partial transcripts for low-latency streaming transcription
    attr_reader :receive_partial_transcripts
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::FallbackGladiaTranscriberModel] This is the Gladia model that will be used. Default is 'fast'
    # @param language_behaviour [Vapi::FallbackGladiaTranscriberLanguageBehaviour] Defines how the transcription model detects the audio language. Default value is
    #  'automatic single language'.
    # @param language [Vapi::FallbackGladiaTranscriberLanguage] Defines the language to use for the transcription. Required when
    #  languageBehaviour is 'manual'.
    # @param languages [Vapi::FallbackGladiaTranscriberLanguages] Defines the languages to use for the transcription. Required when
    #  languageBehaviour is 'manual'.
    # @param transcription_hint [String] Provides a custom vocabulary to the model to improve accuracy of transcribing
    #  context specific words, technical terms, names, etc. If empty, this argument is
    #  ignored.
    #  ⚠️ Warning ⚠️: Please be aware that the transcription_hint field has a character
    #  limit of 600. If you provide a transcription_hint longer than 600 characters, it
    #  will be automatically truncated to meet this limit.
    # @param prosody [Boolean] If prosody is true, you will get a transcription that can contain prosodies i.e.
    #  (laugh) (giggles) (malefic laugh) (toss) (music)… Default value is false.
    # @param audio_enhancer [Boolean] If true, audio will be pre-processed to improve accuracy but latency will
    #  increase. Default value is false.
    # @param confidence_threshold [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    # @param endpointing [Float] Endpointing time in seconds - time to wait before considering speech ended
    # @param speech_threshold [Float] Speech threshold - sensitivity configuration for speech detection (0.0 to 1.0)
    # @param custom_vocabulary_enabled [Boolean] Enable custom vocabulary for improved accuracy
    # @param custom_vocabulary_config [Vapi::GladiaCustomVocabularyConfigDto] Custom vocabulary configuration
    # @param region [Vapi::FallbackGladiaTranscriberRegion] Region for processing audio (us-west or eu-west)
    # @param receive_partial_transcripts [Boolean] Enable partial transcripts for low-latency streaming transcription
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackGladiaTranscriber]
    def initialize(model: OMIT, language_behaviour: OMIT, language: OMIT, languages: OMIT, transcription_hint: OMIT,
                   prosody: OMIT, audio_enhancer: OMIT, confidence_threshold: OMIT, endpointing: OMIT, speech_threshold: OMIT, custom_vocabulary_enabled: OMIT, custom_vocabulary_config: OMIT, region: OMIT, receive_partial_transcripts: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @language_behaviour = language_behaviour if language_behaviour != OMIT
      @language = language if language != OMIT
      @languages = languages if languages != OMIT
      @transcription_hint = transcription_hint if transcription_hint != OMIT
      @prosody = prosody if prosody != OMIT
      @audio_enhancer = audio_enhancer if audio_enhancer != OMIT
      @confidence_threshold = confidence_threshold if confidence_threshold != OMIT
      @endpointing = endpointing if endpointing != OMIT
      @speech_threshold = speech_threshold if speech_threshold != OMIT
      @custom_vocabulary_enabled = custom_vocabulary_enabled if custom_vocabulary_enabled != OMIT
      @custom_vocabulary_config = custom_vocabulary_config if custom_vocabulary_config != OMIT
      @region = region if region != OMIT
      @receive_partial_transcripts = receive_partial_transcripts if receive_partial_transcripts != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "languageBehaviour": language_behaviour,
        "language": language,
        "languages": languages,
        "transcriptionHint": transcription_hint,
        "prosody": prosody,
        "audioEnhancer": audio_enhancer,
        "confidenceThreshold": confidence_threshold,
        "endpointing": endpointing,
        "speechThreshold": speech_threshold,
        "customVocabularyEnabled": custom_vocabulary_enabled,
        "customVocabularyConfig": custom_vocabulary_config,
        "region": region,
        "receivePartialTranscripts": receive_partial_transcripts
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackGladiaTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::FallbackGladiaTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      language_behaviour = parsed_json["languageBehaviour"]
      language = parsed_json["language"]
      languages = parsed_json["languages"]
      transcription_hint = parsed_json["transcriptionHint"]
      prosody = parsed_json["prosody"]
      audio_enhancer = parsed_json["audioEnhancer"]
      confidence_threshold = parsed_json["confidenceThreshold"]
      endpointing = parsed_json["endpointing"]
      speech_threshold = parsed_json["speechThreshold"]
      custom_vocabulary_enabled = parsed_json["customVocabularyEnabled"]
      if parsed_json["customVocabularyConfig"].nil?
        custom_vocabulary_config = nil
      else
        custom_vocabulary_config = parsed_json["customVocabularyConfig"].to_json
        custom_vocabulary_config = Vapi::GladiaCustomVocabularyConfigDto.from_json(json_object: custom_vocabulary_config)
      end
      region = parsed_json["region"]
      receive_partial_transcripts = parsed_json["receivePartialTranscripts"]
      new(
        model: model,
        language_behaviour: language_behaviour,
        language: language,
        languages: languages,
        transcription_hint: transcription_hint,
        prosody: prosody,
        audio_enhancer: audio_enhancer,
        confidence_threshold: confidence_threshold,
        endpointing: endpointing,
        speech_threshold: speech_threshold,
        custom_vocabulary_enabled: custom_vocabulary_enabled,
        custom_vocabulary_config: custom_vocabulary_config,
        region: region,
        receive_partial_transcripts: receive_partial_transcripts,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackGladiaTranscriber to a JSON object
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
      obj.model&.is_a?(Vapi::FallbackGladiaTranscriberModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language_behaviour&.is_a?(Vapi::FallbackGladiaTranscriberLanguageBehaviour) != false || raise("Passed value for field obj.language_behaviour is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::FallbackGladiaTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.languages&.is_a?(Vapi::FallbackGladiaTranscriberLanguages) != false || raise("Passed value for field obj.languages is not the expected type, validation failed.")
      obj.transcription_hint&.is_a?(String) != false || raise("Passed value for field obj.transcription_hint is not the expected type, validation failed.")
      obj.prosody&.is_a?(Boolean) != false || raise("Passed value for field obj.prosody is not the expected type, validation failed.")
      obj.audio_enhancer&.is_a?(Boolean) != false || raise("Passed value for field obj.audio_enhancer is not the expected type, validation failed.")
      obj.confidence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.confidence_threshold is not the expected type, validation failed.")
      obj.endpointing&.is_a?(Float) != false || raise("Passed value for field obj.endpointing is not the expected type, validation failed.")
      obj.speech_threshold&.is_a?(Float) != false || raise("Passed value for field obj.speech_threshold is not the expected type, validation failed.")
      obj.custom_vocabulary_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.custom_vocabulary_enabled is not the expected type, validation failed.")
      obj.custom_vocabulary_config.nil? || Vapi::GladiaCustomVocabularyConfigDto.validate_raw(obj: obj.custom_vocabulary_config)
      obj.region&.is_a?(Vapi::FallbackGladiaTranscriberRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.receive_partial_transcripts&.is_a?(Boolean) != false || raise("Passed value for field obj.receive_partial_transcripts is not the expected type, validation failed.")
    end
  end
end
