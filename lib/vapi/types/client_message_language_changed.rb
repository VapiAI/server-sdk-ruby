# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageLanguageChanged
    # @return [String] This is the type of the message. "language-switched" is sent when the
    #  transcriber is automatically switched based on the detected language.
    attr_reader :type
    # @return [String] This is the language the transcriber is switched to.
    attr_reader :language
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "language-switched" is sent when the
    #  transcriber is automatically switched based on the detected language.
    # @param language [String] This is the language the transcriber is switched to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageLanguageChanged]
    def initialize(type:, language:, additional_properties: nil)
      @type = type
      @language = language
      @additional_properties = additional_properties
      @_field_set = { "type": type, "language": language }
    end

    # Deserialize a JSON object to an instance of ClientMessageLanguageChanged
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageLanguageChanged]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      language = parsed_json["language"]
      new(
        type: type,
        language: language,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageLanguageChanged to a JSON object
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
      obj.language.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
    end
  end
end
