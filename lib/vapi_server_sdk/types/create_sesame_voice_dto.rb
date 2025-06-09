# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CreateSesameVoiceDto
  # @return [String] The name of the voice.
    attr_reader :voice_name
  # @return [String] The transcript of the utterance.
    attr_reader :transcription
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_name [String] The name of the voice.
    # @param transcription [String] The transcript of the utterance.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateSesameVoiceDto]
    def initialize(voice_name: OMIT, transcription: OMIT, additional_properties: nil)
      @voice_name = voice_name if voice_name != OMIT
      @transcription = transcription if transcription != OMIT
      @additional_properties = additional_properties
      @_field_set = { "voiceName": voice_name, "transcription": transcription }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateSesameVoiceDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateSesameVoiceDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voice_name = parsed_json["voiceName"]
      transcription = parsed_json["transcription"]
      new(
        voice_name: voice_name,
        transcription: transcription,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateSesameVoiceDto to a JSON object
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
      obj.voice_name&.is_a?(String) != false || raise("Passed value for field obj.voice_name is not the expected type, validation failed.")
      obj.transcription&.is_a?(String) != false || raise("Passed value for field obj.transcription is not the expected type, validation failed.")
    end
  end
end