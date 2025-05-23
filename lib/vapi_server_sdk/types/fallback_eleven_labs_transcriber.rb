# frozen_string_literal: true

require_relative "fallback_eleven_labs_transcriber_language"
require "ostruct"
require "json"

module Vapi
  class FallbackElevenLabsTranscriber
    # @return [String] This is the model that will be used for the transcription.
    attr_reader :model
    # @return [Vapi::FallbackElevenLabsTranscriberLanguage]
    attr_reader :language
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [String] This is the model that will be used for the transcription.
    # @param language [Vapi::FallbackElevenLabsTranscriberLanguage]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackElevenLabsTranscriber]
    def initialize(model: OMIT, language: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @language = language if language != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model": model, "language": language }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackElevenLabsTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::FallbackElevenLabsTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      language = parsed_json["language"]
      new(
        model: model,
        language: language,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackElevenLabsTranscriber to a JSON object
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
      obj.language&.is_a?(Vapi::FallbackElevenLabsTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
    end
  end
end
