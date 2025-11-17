# frozen_string_literal: true

require_relative "gladia_custom_vocabulary_config_dto_vocabulary_item"
require "ostruct"
require "json"

module Vapi
  class GladiaCustomVocabularyConfigDto
    # @return [Array<Vapi::GladiaCustomVocabularyConfigDtoVocabularyItem>] Array of vocabulary items (strings or objects with value, pronunciations,
    #  intensity, language)
    attr_reader :vocabulary
    # @return [Float] Default intensity for vocabulary items (0.0 to 1.0)
    attr_reader :default_intensity
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param vocabulary [Array<Vapi::GladiaCustomVocabularyConfigDtoVocabularyItem>] Array of vocabulary items (strings or objects with value, pronunciations,
    #  intensity, language)
    # @param default_intensity [Float] Default intensity for vocabulary items (0.0 to 1.0)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GladiaCustomVocabularyConfigDto]
    def initialize(vocabulary:, default_intensity: OMIT, additional_properties: nil)
      @vocabulary = vocabulary
      @default_intensity = default_intensity if default_intensity != OMIT
      @additional_properties = additional_properties
      @_field_set = { "vocabulary": vocabulary, "defaultIntensity": default_intensity }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GladiaCustomVocabularyConfigDto
    #
    # @param json_object [String]
    # @return [Vapi::GladiaCustomVocabularyConfigDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      vocabulary = parsed_json["vocabulary"]&.map do |item|
        item = item.to_json
        Vapi::GladiaCustomVocabularyConfigDtoVocabularyItem.from_json(json_object: item)
      end
      default_intensity = parsed_json["defaultIntensity"]
      new(
        vocabulary: vocabulary,
        default_intensity: default_intensity,
        additional_properties: struct
      )
    end

    # Serialize an instance of GladiaCustomVocabularyConfigDto to a JSON object
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
      obj.vocabulary.is_a?(Array) != false || raise("Passed value for field obj.vocabulary is not the expected type, validation failed.")
      obj.default_intensity&.is_a?(Float) != false || raise("Passed value for field obj.default_intensity is not the expected type, validation failed.")
    end
  end
end
