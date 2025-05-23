# frozen_string_literal: true

require_relative "fallback_transcriber_plan"
require "ostruct"
require "json"

module Vapi
  class AssemblyAiTranscriber
    # @return [String] This is the language that will be set for the transcription.
    attr_reader :language
    # @return [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    attr_reader :confidence_threshold
    # @return [String] The WebSocket URL that the transcriber connects to.
    attr_reader :realtime_url
    # @return [Array<String>] Add up to 2500 characters of custom vocabulary.
    attr_reader :word_boost
    # @return [Float] The duration of the end utterance silence threshold in milliseconds.
    attr_reader :end_utterance_silence_threshold
    # @return [Boolean] Disable partial transcripts.
    #  Set to `true` to not receive partial transcripts. Defaults to `false`.
    attr_reader :disable_partial_transcripts
    # @return [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    attr_reader :fallback_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param language [String] This is the language that will be set for the transcription.
    # @param confidence_threshold [Float] Transcripts below this confidence threshold will be discarded.
    #  @default 0.4
    # @param realtime_url [String] The WebSocket URL that the transcriber connects to.
    # @param word_boost [Array<String>] Add up to 2500 characters of custom vocabulary.
    # @param end_utterance_silence_threshold [Float] The duration of the end utterance silence threshold in milliseconds.
    # @param disable_partial_transcripts [Boolean] Disable partial transcripts.
    #  Set to `true` to not receive partial transcripts. Defaults to `false`.
    # @param fallback_plan [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssemblyAiTranscriber]
    def initialize(language: OMIT, confidence_threshold: OMIT, realtime_url: OMIT, word_boost: OMIT,
                   end_utterance_silence_threshold: OMIT, disable_partial_transcripts: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @language = language if language != OMIT
      @confidence_threshold = confidence_threshold if confidence_threshold != OMIT
      @realtime_url = realtime_url if realtime_url != OMIT
      @word_boost = word_boost if word_boost != OMIT
      @end_utterance_silence_threshold = end_utterance_silence_threshold if end_utterance_silence_threshold != OMIT
      @disable_partial_transcripts = disable_partial_transcripts if disable_partial_transcripts != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "language": language,
        "confidenceThreshold": confidence_threshold,
        "realtimeUrl": realtime_url,
        "wordBoost": word_boost,
        "endUtteranceSilenceThreshold": end_utterance_silence_threshold,
        "disablePartialTranscripts": disable_partial_transcripts,
        "fallbackPlan": fallback_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssemblyAiTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::AssemblyAiTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      language = parsed_json["language"]
      confidence_threshold = parsed_json["confidenceThreshold"]
      realtime_url = parsed_json["realtimeUrl"]
      word_boost = parsed_json["wordBoost"]
      end_utterance_silence_threshold = parsed_json["endUtteranceSilenceThreshold"]
      disable_partial_transcripts = parsed_json["disablePartialTranscripts"]
      if parsed_json["fallbackPlan"].nil?
        fallback_plan = nil
      else
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackTranscriberPlan.from_json(json_object: fallback_plan)
      end
      new(
        language: language,
        confidence_threshold: confidence_threshold,
        realtime_url: realtime_url,
        word_boost: word_boost,
        end_utterance_silence_threshold: end_utterance_silence_threshold,
        disable_partial_transcripts: disable_partial_transcripts,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssemblyAiTranscriber to a JSON object
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
      obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.confidence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.confidence_threshold is not the expected type, validation failed.")
      obj.realtime_url&.is_a?(String) != false || raise("Passed value for field obj.realtime_url is not the expected type, validation failed.")
      obj.word_boost&.is_a?(Array) != false || raise("Passed value for field obj.word_boost is not the expected type, validation failed.")
      obj.end_utterance_silence_threshold&.is_a?(Float) != false || raise("Passed value for field obj.end_utterance_silence_threshold is not the expected type, validation failed.")
      obj.disable_partial_transcripts&.is_a?(Boolean) != false || raise("Passed value for field obj.disable_partial_transcripts is not the expected type, validation failed.")
      obj.fallback_plan.nil? || Vapi::FallbackTranscriberPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end
