# frozen_string_literal: true

require_relative "fallback_speechmatics_transcriber_model"
require_relative "fallback_speechmatics_transcriber_language"
require_relative "fallback_speechmatics_transcriber_operating_point"
require_relative "fallback_speechmatics_transcriber_region"
require_relative "speechmatics_custom_vocabulary_item"
require_relative "fallback_speechmatics_transcriber_numeral_style"
require "ostruct"
require "json"

module Vapi
  class FallbackSpeechmaticsTranscriber
    # @return [Vapi::FallbackSpeechmaticsTranscriberModel] This is the model that will be used for the transcription.
    attr_reader :model
    # @return [Vapi::FallbackSpeechmaticsTranscriberLanguage]
    attr_reader :language
    # @return [Vapi::FallbackSpeechmaticsTranscriberOperatingPoint] This is the operating point for the transcription. Choose between `standard` for
    #  faster turnaround with strong accuracy or `enhanced` for highest accuracy when
    #  precision is critical.
    #  @default 'enhanced'
    attr_reader :operating_point
    # @return [Vapi::FallbackSpeechmaticsTranscriberRegion] This is the region for the Speechmatics API. Choose between EU (Europe) and US
    #  (United States) regions for lower latency and data sovereignty compliance.
    #  @default 'eu'
    attr_reader :region
    # @return [Boolean] This enables speaker diarization, which identifies and separates speakers in the
    #  transcription. Essential for multi-speaker conversations and conference calls.
    #  @default false
    attr_reader :enable_diarization
    # @return [Float] This sets the maximum number of speakers to detect when diarization is enabled.
    #  Only used when enableDiarization is true.
    #  @default 2
    attr_reader :max_speakers
    # @return [Array<String>] Provides friendly speaker labels that map to diarization indices (Speaker 1 ->
    #  labels[0]).
    attr_reader :speaker_labels
    # @return [Boolean] This enables partial transcripts during speech recognition. When false, only
    #  final transcripts are returned.
    #  @default true
    attr_reader :enable_partials
    # @return [Float] This sets the maximum delay in milliseconds for partial transcripts. Balances
    #  latency and accuracy.
    #  @default 3000
    attr_reader :max_delay
    # @return [Array<Vapi::SpeechmaticsCustomVocabularyItem>]
    attr_reader :custom_vocabulary
    # @return [Vapi::FallbackSpeechmaticsTranscriberNumeralStyle] This controls how numbers are formatted in the transcription output.
    #  @default 'written'
    attr_reader :numeral_style
    # @return [Boolean] This enables detection of non-speech audio events like music, applause, and
    #  laughter.
    #  @default false
    attr_reader :enable_entities
    # @return [Boolean] This enables automatic punctuation in the transcription output.
    #  @default true
    attr_reader :enable_punctuation
    # @return [Boolean] This enables automatic capitalization in the transcription output.
    #  @default true
    attr_reader :enable_capitalization
    # @return [Float] This is the sensitivity level for end-of-turn detection, which determines when a
    #  speaker has finished talking. Higher values are more sensitive.
    #  @default 0.5
    attr_reader :end_of_turn_sensitivity
    # @return [Boolean] This enables removal of disfluencies (um, uh) from the transcript to create
    #  cleaner, more professional output.
    #  @default false
    attr_reader :remove_disfluencies
    # @return [Float] This is the minimum duration in seconds for speech segments. Shorter segments
    #  will be filtered out. Helps remove noise and improve accuracy.
    #  @default 0.0
    attr_reader :minimum_speech_duration
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::FallbackSpeechmaticsTranscriberModel] This is the model that will be used for the transcription.
    # @param language [Vapi::FallbackSpeechmaticsTranscriberLanguage]
    # @param operating_point [Vapi::FallbackSpeechmaticsTranscriberOperatingPoint] This is the operating point for the transcription. Choose between `standard` for
    #  faster turnaround with strong accuracy or `enhanced` for highest accuracy when
    #  precision is critical.
    #  @default 'enhanced'
    # @param region [Vapi::FallbackSpeechmaticsTranscriberRegion] This is the region for the Speechmatics API. Choose between EU (Europe) and US
    #  (United States) regions for lower latency and data sovereignty compliance.
    #  @default 'eu'
    # @param enable_diarization [Boolean] This enables speaker diarization, which identifies and separates speakers in the
    #  transcription. Essential for multi-speaker conversations and conference calls.
    #  @default false
    # @param max_speakers [Float] This sets the maximum number of speakers to detect when diarization is enabled.
    #  Only used when enableDiarization is true.
    #  @default 2
    # @param speaker_labels [Array<String>] Provides friendly speaker labels that map to diarization indices (Speaker 1 ->
    #  labels[0]).
    # @param enable_partials [Boolean] This enables partial transcripts during speech recognition. When false, only
    #  final transcripts are returned.
    #  @default true
    # @param max_delay [Float] This sets the maximum delay in milliseconds for partial transcripts. Balances
    #  latency and accuracy.
    #  @default 3000
    # @param custom_vocabulary [Array<Vapi::SpeechmaticsCustomVocabularyItem>]
    # @param numeral_style [Vapi::FallbackSpeechmaticsTranscriberNumeralStyle] This controls how numbers are formatted in the transcription output.
    #  @default 'written'
    # @param enable_entities [Boolean] This enables detection of non-speech audio events like music, applause, and
    #  laughter.
    #  @default false
    # @param enable_punctuation [Boolean] This enables automatic punctuation in the transcription output.
    #  @default true
    # @param enable_capitalization [Boolean] This enables automatic capitalization in the transcription output.
    #  @default true
    # @param end_of_turn_sensitivity [Float] This is the sensitivity level for end-of-turn detection, which determines when a
    #  speaker has finished talking. Higher values are more sensitive.
    #  @default 0.5
    # @param remove_disfluencies [Boolean] This enables removal of disfluencies (um, uh) from the transcript to create
    #  cleaner, more professional output.
    #  @default false
    # @param minimum_speech_duration [Float] This is the minimum duration in seconds for speech segments. Shorter segments
    #  will be filtered out. Helps remove noise and improve accuracy.
    #  @default 0.0
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackSpeechmaticsTranscriber]
    def initialize(custom_vocabulary:, model: OMIT, language: OMIT, operating_point: OMIT, region: OMIT, enable_diarization: OMIT,
                   max_speakers: OMIT, speaker_labels: OMIT, enable_partials: OMIT, max_delay: OMIT, numeral_style: OMIT, enable_entities: OMIT, enable_punctuation: OMIT, enable_capitalization: OMIT, end_of_turn_sensitivity: OMIT, remove_disfluencies: OMIT, minimum_speech_duration: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @language = language if language != OMIT
      @operating_point = operating_point if operating_point != OMIT
      @region = region if region != OMIT
      @enable_diarization = enable_diarization if enable_diarization != OMIT
      @max_speakers = max_speakers if max_speakers != OMIT
      @speaker_labels = speaker_labels if speaker_labels != OMIT
      @enable_partials = enable_partials if enable_partials != OMIT
      @max_delay = max_delay if max_delay != OMIT
      @custom_vocabulary = custom_vocabulary
      @numeral_style = numeral_style if numeral_style != OMIT
      @enable_entities = enable_entities if enable_entities != OMIT
      @enable_punctuation = enable_punctuation if enable_punctuation != OMIT
      @enable_capitalization = enable_capitalization if enable_capitalization != OMIT
      @end_of_turn_sensitivity = end_of_turn_sensitivity if end_of_turn_sensitivity != OMIT
      @remove_disfluencies = remove_disfluencies if remove_disfluencies != OMIT
      @minimum_speech_duration = minimum_speech_duration if minimum_speech_duration != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "language": language,
        "operatingPoint": operating_point,
        "region": region,
        "enableDiarization": enable_diarization,
        "maxSpeakers": max_speakers,
        "speakerLabels": speaker_labels,
        "enablePartials": enable_partials,
        "maxDelay": max_delay,
        "customVocabulary": custom_vocabulary,
        "numeralStyle": numeral_style,
        "enableEntities": enable_entities,
        "enablePunctuation": enable_punctuation,
        "enableCapitalization": enable_capitalization,
        "endOfTurnSensitivity": end_of_turn_sensitivity,
        "removeDisfluencies": remove_disfluencies,
        "minimumSpeechDuration": minimum_speech_duration
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackSpeechmaticsTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::FallbackSpeechmaticsTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      language = parsed_json["language"]
      operating_point = parsed_json["operatingPoint"]
      region = parsed_json["region"]
      enable_diarization = parsed_json["enableDiarization"]
      max_speakers = parsed_json["maxSpeakers"]
      speaker_labels = parsed_json["speakerLabels"]
      enable_partials = parsed_json["enablePartials"]
      max_delay = parsed_json["maxDelay"]
      custom_vocabulary = parsed_json["customVocabulary"]&.map do |item|
        item = item.to_json
        Vapi::SpeechmaticsCustomVocabularyItem.from_json(json_object: item)
      end
      numeral_style = parsed_json["numeralStyle"]
      enable_entities = parsed_json["enableEntities"]
      enable_punctuation = parsed_json["enablePunctuation"]
      enable_capitalization = parsed_json["enableCapitalization"]
      end_of_turn_sensitivity = parsed_json["endOfTurnSensitivity"]
      remove_disfluencies = parsed_json["removeDisfluencies"]
      minimum_speech_duration = parsed_json["minimumSpeechDuration"]
      new(
        model: model,
        language: language,
        operating_point: operating_point,
        region: region,
        enable_diarization: enable_diarization,
        max_speakers: max_speakers,
        speaker_labels: speaker_labels,
        enable_partials: enable_partials,
        max_delay: max_delay,
        custom_vocabulary: custom_vocabulary,
        numeral_style: numeral_style,
        enable_entities: enable_entities,
        enable_punctuation: enable_punctuation,
        enable_capitalization: enable_capitalization,
        end_of_turn_sensitivity: end_of_turn_sensitivity,
        remove_disfluencies: remove_disfluencies,
        minimum_speech_duration: minimum_speech_duration,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackSpeechmaticsTranscriber to a JSON object
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
      obj.model&.is_a?(Vapi::FallbackSpeechmaticsTranscriberModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::FallbackSpeechmaticsTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.operating_point&.is_a?(Vapi::FallbackSpeechmaticsTranscriberOperatingPoint) != false || raise("Passed value for field obj.operating_point is not the expected type, validation failed.")
      obj.region&.is_a?(Vapi::FallbackSpeechmaticsTranscriberRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.enable_diarization&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_diarization is not the expected type, validation failed.")
      obj.max_speakers&.is_a?(Float) != false || raise("Passed value for field obj.max_speakers is not the expected type, validation failed.")
      obj.speaker_labels&.is_a?(Array) != false || raise("Passed value for field obj.speaker_labels is not the expected type, validation failed.")
      obj.enable_partials&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_partials is not the expected type, validation failed.")
      obj.max_delay&.is_a?(Float) != false || raise("Passed value for field obj.max_delay is not the expected type, validation failed.")
      obj.custom_vocabulary.is_a?(Array) != false || raise("Passed value for field obj.custom_vocabulary is not the expected type, validation failed.")
      obj.numeral_style&.is_a?(Vapi::FallbackSpeechmaticsTranscriberNumeralStyle) != false || raise("Passed value for field obj.numeral_style is not the expected type, validation failed.")
      obj.enable_entities&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_entities is not the expected type, validation failed.")
      obj.enable_punctuation&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_punctuation is not the expected type, validation failed.")
      obj.enable_capitalization&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_capitalization is not the expected type, validation failed.")
      obj.end_of_turn_sensitivity&.is_a?(Float) != false || raise("Passed value for field obj.end_of_turn_sensitivity is not the expected type, validation failed.")
      obj.remove_disfluencies&.is_a?(Boolean) != false || raise("Passed value for field obj.remove_disfluencies is not the expected type, validation failed.")
      obj.minimum_speech_duration&.is_a?(Float) != false || raise("Passed value for field obj.minimum_speech_duration is not the expected type, validation failed.")
    end
  end
end
