# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class GladiaVocabularyItemDto
    # @return [String] The vocabulary word or phrase
    attr_reader :value
    # @return [Array<String>] Alternative pronunciations for the vocabulary item
    attr_reader :pronunciations
    # @return [Float] Intensity for this specific vocabulary item (0.0 to 1.0)
    attr_reader :intensity
    # @return [String] Language code for this vocabulary item (ISO 639-1)
    attr_reader :language
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [String] The vocabulary word or phrase
    # @param pronunciations [Array<String>] Alternative pronunciations for the vocabulary item
    # @param intensity [Float] Intensity for this specific vocabulary item (0.0 to 1.0)
    # @param language [String] Language code for this vocabulary item (ISO 639-1)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GladiaVocabularyItemDto]
    def initialize(value:, pronunciations: OMIT, intensity: OMIT, language: OMIT, additional_properties: nil)
      @value = value
      @pronunciations = pronunciations if pronunciations != OMIT
      @intensity = intensity if intensity != OMIT
      @language = language if language != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "value": value,
        "pronunciations": pronunciations,
        "intensity": intensity,
        "language": language
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GladiaVocabularyItemDto
    #
    # @param json_object [String]
    # @return [Vapi::GladiaVocabularyItemDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      value = parsed_json["value"]
      pronunciations = parsed_json["pronunciations"]
      intensity = parsed_json["intensity"]
      language = parsed_json["language"]
      new(
        value: value,
        pronunciations: pronunciations,
        intensity: intensity,
        language: language,
        additional_properties: struct
      )
    end

    # Serialize an instance of GladiaVocabularyItemDto to a JSON object
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
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.pronunciations&.is_a?(Array) != false || raise("Passed value for field obj.pronunciations is not the expected type, validation failed.")
      obj.intensity&.is_a?(Float) != false || raise("Passed value for field obj.intensity is not the expected type, validation failed.")
      obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
    end
  end
end
