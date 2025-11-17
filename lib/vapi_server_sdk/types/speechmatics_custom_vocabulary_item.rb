# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SpeechmaticsCustomVocabularyItem
    # @return [String] The word or phrase to add to the custom vocabulary.
    attr_reader :content
    # @return [Array<String>] Alternative phonetic representations of how the word might sound. This helps
    #  recognition when the word might be pronounced differently.
    attr_reader :sounds_like
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param content [String] The word or phrase to add to the custom vocabulary.
    # @param sounds_like [Array<String>] Alternative phonetic representations of how the word might sound. This helps
    #  recognition when the word might be pronounced differently.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SpeechmaticsCustomVocabularyItem]
    def initialize(content:, sounds_like: OMIT, additional_properties: nil)
      @content = content
      @sounds_like = sounds_like if sounds_like != OMIT
      @additional_properties = additional_properties
      @_field_set = { "content": content, "soundsLike": sounds_like }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SpeechmaticsCustomVocabularyItem
    #
    # @param json_object [String]
    # @return [Vapi::SpeechmaticsCustomVocabularyItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      content = parsed_json["content"]
      sounds_like = parsed_json["soundsLike"]
      new(
        content: content,
        sounds_like: sounds_like,
        additional_properties: struct
      )
    end

    # Serialize an instance of SpeechmaticsCustomVocabularyItem to a JSON object
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
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.sounds_like&.is_a?(Array) != false || raise("Passed value for field obj.sounds_like is not the expected type, validation failed.")
    end
  end
end
