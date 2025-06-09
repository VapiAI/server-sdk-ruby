# frozen_string_literal: true
require_relative "fallback_azure_speech_transcriber_language"
require "ostruct"
require "json"

module Vapi
  class FallbackAzureSpeechTranscriber
  # @return [Vapi::FallbackAzureSpeechTranscriberLanguage] This is the language that will be set for the transcription. The list of
#  languages Azure supports can be found here:
#  n.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=stt
    attr_reader :language
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param language [Vapi::FallbackAzureSpeechTranscriberLanguage] This is the language that will be set for the transcription. The list of
#  languages Azure supports can be found here:
#  n.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=stt
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackAzureSpeechTranscriber]
    def initialize(language: OMIT, additional_properties: nil)
      @language = language if language != OMIT
      @additional_properties = additional_properties
      @_field_set = { "language": language }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FallbackAzureSpeechTranscriber
    #
    # @param json_object [String] 
    # @return [Vapi::FallbackAzureSpeechTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      language = parsed_json["language"]
      new(language: language, additional_properties: struct)
    end
# Serialize an instance of FallbackAzureSpeechTranscriber to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.language&.is_a?(Vapi::FallbackAzureSpeechTranscriberLanguage) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
    end
  end
end