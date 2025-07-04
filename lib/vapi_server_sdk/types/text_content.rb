# frozen_string_literal: true

require_relative "text_content_language"
require "ostruct"
require "json"

module Vapi
  class TextContent
    # @return [String]
    attr_reader :type
    # @return [String]
    attr_reader :text
    # @return [Vapi::TextContentLanguage]
    attr_reader :language
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param text [String]
    # @param language [Vapi::TextContentLanguage]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TextContent]
    def initialize(type:, text:, language:, additional_properties: nil)
      @type = type
      @text = text
      @language = language
      @additional_properties = additional_properties
      @_field_set = { "type": type, "text": text, "language": language }
    end

    # Deserialize a JSON object to an instance of TextContent
    #
    # @param json_object [String]
    # @return [Vapi::TextContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      text = parsed_json["text"]
      language = parsed_json["language"]
      new(
        type: type,
        text: text,
        language: language,
        additional_properties: struct
      )
    end

    # Serialize an instance of TextContent to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.language.is_a?(Vapi::TextContentLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
    end
  end
end
