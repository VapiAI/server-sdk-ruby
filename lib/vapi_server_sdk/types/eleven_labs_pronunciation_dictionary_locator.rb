# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ElevenLabsPronunciationDictionaryLocator
    # @return [String] This is the ID of the pronunciation dictionary to use.
    attr_reader :pronunciation_dictionary_id
    # @return [String] This is the version ID of the pronunciation dictionary to use.
    attr_reader :version_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param pronunciation_dictionary_id [String] This is the ID of the pronunciation dictionary to use.
    # @param version_id [String] This is the version ID of the pronunciation dictionary to use.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ElevenLabsPronunciationDictionaryLocator]
    def initialize(pronunciation_dictionary_id:, version_id:, additional_properties: nil)
      @pronunciation_dictionary_id = pronunciation_dictionary_id
      @version_id = version_id
      @additional_properties = additional_properties
      @_field_set = { "pronunciationDictionaryId": pronunciation_dictionary_id, "versionId": version_id }
    end

    # Deserialize a JSON object to an instance of
    #  ElevenLabsPronunciationDictionaryLocator
    #
    # @param json_object [String]
    # @return [Vapi::ElevenLabsPronunciationDictionaryLocator]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      pronunciation_dictionary_id = parsed_json["pronunciationDictionaryId"]
      version_id = parsed_json["versionId"]
      new(
        pronunciation_dictionary_id: pronunciation_dictionary_id,
        version_id: version_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of ElevenLabsPronunciationDictionaryLocator to a JSON
    #  object
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
      obj.pronunciation_dictionary_id.is_a?(String) != false || raise("Passed value for field obj.pronunciation_dictionary_id is not the expected type, validation failed.")
      obj.version_id.is_a?(String) != false || raise("Passed value for field obj.version_id is not the expected type, validation failed.")
    end
  end
end
