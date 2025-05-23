# frozen_string_literal: true

require_relative "talkscriber_transcriber_language"
require_relative "fallback_transcriber_plan"
require "ostruct"
require "json"

module Vapi
  class TalkscriberTranscriber
    # @return [String] This is the model that will be used for the transcription.
    attr_reader :model
    # @return [Vapi::TalkscriberTranscriberLanguage] This is the language that will be set for the transcription. The list of
    #  languages Whisper supports can be found here:
    #  https://github.com/openai/whisper/blob/main/whisper/tokenizer.py
    attr_reader :language
    # @return [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    attr_reader :fallback_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [String] This is the model that will be used for the transcription.
    # @param language [Vapi::TalkscriberTranscriberLanguage] This is the language that will be set for the transcription. The list of
    #  languages Whisper supports can be found here:
    #  https://github.com/openai/whisper/blob/main/whisper/tokenizer.py
    # @param fallback_plan [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
    #  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TalkscriberTranscriber]
    def initialize(model: OMIT, language: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @language = language if language != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model": model, "language": language, "fallbackPlan": fallback_plan }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TalkscriberTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::TalkscriberTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      language = parsed_json["language"]
      if parsed_json["fallbackPlan"].nil?
        fallback_plan = nil
      else
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackTranscriberPlan.from_json(json_object: fallback_plan)
      end
      new(
        model: model,
        language: language,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of TalkscriberTranscriber to a JSON object
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
      obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.language&.is_a?(Vapi::TalkscriberTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.fallback_plan.nil? || Vapi::FallbackTranscriberPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end
