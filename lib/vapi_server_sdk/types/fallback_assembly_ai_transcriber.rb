# frozen_string_literal: true

require_relative "fallback_assembly_ai_transcriber_language"
require "ostruct"
require "json"

module Vapi
  class FallbackAssemblyAiTranscriber
    # @return [Vapi::FallbackAssemblyAiTranscriberLanguage] This is the language that will be set for the transcription.
    attr_reader :language
    # @return [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    attr_reader :confidence_threshold
    # @return [Boolean] This enables formatting of transcripts.
    #  @default true
    attr_reader :format_turns
    # @return [Float] This is the end of turn confidence threshold. The minimum confidence that the
    #  end of turn is detected.
    #  Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    #  @min 0
    #  @max 1
    #  @default 0.7
    attr_reader :end_of_turn_confidence_threshold
    # @return [Float] This is the minimum end of turn silence when confident in milliseconds.
    #  Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    #  @default 160
    attr_reader :min_end_of_turn_silence_when_confident
    # @return [Float]
    attr_reader :word_finalization_max_wait_time
    # @return [Float] This is the maximum turn silence time in milliseconds.
    #  Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    #  @default 400
    attr_reader :max_turn_silence
    # @return [String] The WebSocket URL that the transcriber connects to.
    attr_reader :realtime_url
    # @return [Array<String>] Add up to 2500 characters of custom vocabulary.
    attr_reader :word_boost
    # @return [Array<String>] Keyterms prompting improves recognition accuracy for specific words and phrases.
    #  Can include up to 100 keyterms, each up to 50 characters.
    #  Costs an additional $0.04/hour when enabled.
    attr_reader :keyterms_prompt
    # @return [Float] The duration of the end utterance silence threshold in milliseconds.
    attr_reader :end_utterance_silence_threshold
    # @return [Boolean] Disable partial transcripts.
    #  Set to `true` to not receive partial transcripts. Defaults to `false`.
    attr_reader :disable_partial_transcripts
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param language [Vapi::FallbackAssemblyAiTranscriberLanguage] This is the language that will be set for the transcription.
    # @param confidence_threshold [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    # @param format_turns [Boolean] This enables formatting of transcripts.
    #  @default true
    # @param end_of_turn_confidence_threshold [Float] This is the end of turn confidence threshold. The minimum confidence that the
    #  end of turn is detected.
    #  Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    #  @min 0
    #  @max 1
    #  @default 0.7
    # @param min_end_of_turn_silence_when_confident [Float] This is the minimum end of turn silence when confident in milliseconds.
    #  Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    #  @default 160
    # @param word_finalization_max_wait_time [Float]
    # @param max_turn_silence [Float] This is the maximum turn silence time in milliseconds.
    #  Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    #  @default 400
    # @param realtime_url [String] The WebSocket URL that the transcriber connects to.
    # @param word_boost [Array<String>] Add up to 2500 characters of custom vocabulary.
    # @param keyterms_prompt [Array<String>] Keyterms prompting improves recognition accuracy for specific words and phrases.
    #  Can include up to 100 keyterms, each up to 50 characters.
    #  Costs an additional $0.04/hour when enabled.
    # @param end_utterance_silence_threshold [Float] The duration of the end utterance silence threshold in milliseconds.
    # @param disable_partial_transcripts [Boolean] Disable partial transcripts.
    #  Set to `true` to not receive partial transcripts. Defaults to `false`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackAssemblyAiTranscriber]
    def initialize(language: OMIT, confidence_threshold: OMIT, format_turns: OMIT,
                   end_of_turn_confidence_threshold: OMIT, min_end_of_turn_silence_when_confident: OMIT, word_finalization_max_wait_time: OMIT, max_turn_silence: OMIT, realtime_url: OMIT, word_boost: OMIT, keyterms_prompt: OMIT, end_utterance_silence_threshold: OMIT, disable_partial_transcripts: OMIT, additional_properties: nil)
      @language = language if language != OMIT
      @confidence_threshold = confidence_threshold if confidence_threshold != OMIT
      @format_turns = format_turns if format_turns != OMIT
      @end_of_turn_confidence_threshold = end_of_turn_confidence_threshold if end_of_turn_confidence_threshold != OMIT
      if min_end_of_turn_silence_when_confident != OMIT
        @min_end_of_turn_silence_when_confident = min_end_of_turn_silence_when_confident
      end
      @word_finalization_max_wait_time = word_finalization_max_wait_time if word_finalization_max_wait_time != OMIT
      @max_turn_silence = max_turn_silence if max_turn_silence != OMIT
      @realtime_url = realtime_url if realtime_url != OMIT
      @word_boost = word_boost if word_boost != OMIT
      @keyterms_prompt = keyterms_prompt if keyterms_prompt != OMIT
      @end_utterance_silence_threshold = end_utterance_silence_threshold if end_utterance_silence_threshold != OMIT
      @disable_partial_transcripts = disable_partial_transcripts if disable_partial_transcripts != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "language": language,
        "confidenceThreshold": confidence_threshold,
        "formatTurns": format_turns,
        "endOfTurnConfidenceThreshold": end_of_turn_confidence_threshold,
        "minEndOfTurnSilenceWhenConfident": min_end_of_turn_silence_when_confident,
        "wordFinalizationMaxWaitTime": word_finalization_max_wait_time,
        "maxTurnSilence": max_turn_silence,
        "realtimeUrl": realtime_url,
        "wordBoost": word_boost,
        "keytermsPrompt": keyterms_prompt,
        "endUtteranceSilenceThreshold": end_utterance_silence_threshold,
        "disablePartialTranscripts": disable_partial_transcripts
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackAssemblyAiTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::FallbackAssemblyAiTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      language = parsed_json["language"]
      confidence_threshold = parsed_json["confidenceThreshold"]
      format_turns = parsed_json["formatTurns"]
      end_of_turn_confidence_threshold = parsed_json["endOfTurnConfidenceThreshold"]
      min_end_of_turn_silence_when_confident = parsed_json["minEndOfTurnSilenceWhenConfident"]
      word_finalization_max_wait_time = parsed_json["wordFinalizationMaxWaitTime"]
      max_turn_silence = parsed_json["maxTurnSilence"]
      realtime_url = parsed_json["realtimeUrl"]
      word_boost = parsed_json["wordBoost"]
      keyterms_prompt = parsed_json["keytermsPrompt"]
      end_utterance_silence_threshold = parsed_json["endUtteranceSilenceThreshold"]
      disable_partial_transcripts = parsed_json["disablePartialTranscripts"]
      new(
        language: language,
        confidence_threshold: confidence_threshold,
        format_turns: format_turns,
        end_of_turn_confidence_threshold: end_of_turn_confidence_threshold,
        min_end_of_turn_silence_when_confident: min_end_of_turn_silence_when_confident,
        word_finalization_max_wait_time: word_finalization_max_wait_time,
        max_turn_silence: max_turn_silence,
        realtime_url: realtime_url,
        word_boost: word_boost,
        keyterms_prompt: keyterms_prompt,
        end_utterance_silence_threshold: end_utterance_silence_threshold,
        disable_partial_transcripts: disable_partial_transcripts,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackAssemblyAiTranscriber to a JSON object
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
      obj.language&.is_a?(Vapi::FallbackAssemblyAiTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.confidence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.confidence_threshold is not the expected type, validation failed.")
      obj.format_turns&.is_a?(Boolean) != false || raise("Passed value for field obj.format_turns is not the expected type, validation failed.")
      obj.end_of_turn_confidence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.end_of_turn_confidence_threshold is not the expected type, validation failed.")
      obj.min_end_of_turn_silence_when_confident&.is_a?(Float) != false || raise("Passed value for field obj.min_end_of_turn_silence_when_confident is not the expected type, validation failed.")
      obj.word_finalization_max_wait_time&.is_a?(Float) != false || raise("Passed value for field obj.word_finalization_max_wait_time is not the expected type, validation failed.")
      obj.max_turn_silence&.is_a?(Float) != false || raise("Passed value for field obj.max_turn_silence is not the expected type, validation failed.")
      obj.realtime_url&.is_a?(String) != false || raise("Passed value for field obj.realtime_url is not the expected type, validation failed.")
      obj.word_boost&.is_a?(Array) != false || raise("Passed value for field obj.word_boost is not the expected type, validation failed.")
      obj.keyterms_prompt&.is_a?(Array) != false || raise("Passed value for field obj.keyterms_prompt is not the expected type, validation failed.")
      obj.end_utterance_silence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.end_utterance_silence_threshold is not the expected type, validation failed.")
      obj.disable_partial_transcripts&.is_a?(Boolean) != false || raise("Passed value for field obj.disable_partial_transcripts is not the expected type, validation failed.")
    end
  end
end
