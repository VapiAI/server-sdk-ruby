# frozen_string_literal: true

require_relative "azure_speech_transcriber_language"
require_relative "azure_speech_transcriber_segmentation_strategy"
require_relative "fallback_transcriber_plan"
require "ostruct"
require "json"

module Vapi
  class AzureSpeechTranscriber
    # @return [Vapi::AzureSpeechTranscriberLanguage] This is the language that will be set for the transcription. The list of
    #  languages Azure supports can be found here:
    #  n.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=stt
    attr_reader :language
    # @return [Vapi::AzureSpeechTranscriberSegmentationStrategy] Controls how phrase boundaries are detected, enabling either simple time/silence
    #  heuristics or more advanced semantic segmentation.
    attr_reader :segmentation_strategy
    # @return [Float] Duration of detected silence after which the service finalizes a phrase.
    #  Configure to adjust sensitivity to pauses in speech.
    attr_reader :segmentation_silence_timeout_ms
    # @return [Float] Maximum duration a segment can reach before being cut off when using time-based
    #  segmentation.
    attr_reader :segmentation_maximum_time_ms
    # @return [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    attr_reader :fallback_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param language [Vapi::AzureSpeechTranscriberLanguage] This is the language that will be set for the transcription. The list of
    #  languages Azure supports can be found here:
    #  n.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=stt
    # @param segmentation_strategy [Vapi::AzureSpeechTranscriberSegmentationStrategy] Controls how phrase boundaries are detected, enabling either simple time/silence
    #  heuristics or more advanced semantic segmentation.
    # @param segmentation_silence_timeout_ms [Float] Duration of detected silence after which the service finalizes a phrase.
    #  Configure to adjust sensitivity to pauses in speech.
    # @param segmentation_maximum_time_ms [Float] Maximum duration a segment can reach before being cut off when using time-based
    #  segmentation.
    # @param fallback_plan [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AzureSpeechTranscriber]
    def initialize(language: OMIT, segmentation_strategy: OMIT, segmentation_silence_timeout_ms: OMIT,
                   segmentation_maximum_time_ms: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @language = language if language != OMIT
      @segmentation_strategy = segmentation_strategy if segmentation_strategy != OMIT
      @segmentation_silence_timeout_ms = segmentation_silence_timeout_ms if segmentation_silence_timeout_ms != OMIT
      @segmentation_maximum_time_ms = segmentation_maximum_time_ms if segmentation_maximum_time_ms != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "language": language,
        "segmentationStrategy": segmentation_strategy,
        "segmentationSilenceTimeoutMs": segmentation_silence_timeout_ms,
        "segmentationMaximumTimeMs": segmentation_maximum_time_ms,
        "fallbackPlan": fallback_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AzureSpeechTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::AzureSpeechTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      language = parsed_json["language"]
      segmentation_strategy = parsed_json["segmentationStrategy"]
      segmentation_silence_timeout_ms = parsed_json["segmentationSilenceTimeoutMs"]
      segmentation_maximum_time_ms = parsed_json["segmentationMaximumTimeMs"]
      if parsed_json["fallbackPlan"].nil?
        fallback_plan = nil
      else
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackTranscriberPlan.from_json(json_object: fallback_plan)
      end
      new(
        language: language,
        segmentation_strategy: segmentation_strategy,
        segmentation_silence_timeout_ms: segmentation_silence_timeout_ms,
        segmentation_maximum_time_ms: segmentation_maximum_time_ms,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of AzureSpeechTranscriber to a JSON object
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
      obj.language&.is_a?(Vapi::AzureSpeechTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.segmentation_strategy&.is_a?(Vapi::AzureSpeechTranscriberSegmentationStrategy) != false || raise("Passed value for field obj.segmentation_strategy is not the expected type, validation failed.")
      obj.segmentation_silence_timeout_ms&.is_a?(Float) != false || raise("Passed value for field obj.segmentation_silence_timeout_ms is not the expected type, validation failed.")
      obj.segmentation_maximum_time_ms&.is_a?(Float) != false || raise("Passed value for field obj.segmentation_maximum_time_ms is not the expected type, validation failed.")
      obj.fallback_plan.nil? || Vapi::FallbackTranscriberPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end
