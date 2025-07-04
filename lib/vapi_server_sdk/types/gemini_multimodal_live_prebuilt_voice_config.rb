# frozen_string_literal: true

require_relative "gemini_multimodal_live_prebuilt_voice_config_voice_name"
require "ostruct"
require "json"

module Vapi
  class GeminiMultimodalLivePrebuiltVoiceConfig
    # @return [Vapi::GeminiMultimodalLivePrebuiltVoiceConfigVoiceName]
    attr_reader :voice_name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_name [Vapi::GeminiMultimodalLivePrebuiltVoiceConfigVoiceName]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GeminiMultimodalLivePrebuiltVoiceConfig]
    def initialize(voice_name:, additional_properties: nil)
      @voice_name = voice_name
      @additional_properties = additional_properties
      @_field_set = { "voiceName": voice_name }
    end

    # Deserialize a JSON object to an instance of
    #  GeminiMultimodalLivePrebuiltVoiceConfig
    #
    # @param json_object [String]
    # @return [Vapi::GeminiMultimodalLivePrebuiltVoiceConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voice_name = parsed_json["voiceName"]
      new(voice_name: voice_name, additional_properties: struct)
    end

    # Serialize an instance of GeminiMultimodalLivePrebuiltVoiceConfig to a JSON
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
      obj.voice_name.is_a?(Vapi::GeminiMultimodalLivePrebuiltVoiceConfigVoiceName) != false || raise("Passed value for field obj.voice_name is not the expected type, validation failed.")
    end
  end
end
