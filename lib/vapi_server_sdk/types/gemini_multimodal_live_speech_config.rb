# frozen_string_literal: true
require_relative "gemini_multimodal_live_voice_config"
require "ostruct"
require "json"

module Vapi
  class GeminiMultimodalLiveSpeechConfig
  # @return [Vapi::GeminiMultimodalLiveVoiceConfig] 
    attr_reader :voice_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_config [Vapi::GeminiMultimodalLiveVoiceConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GeminiMultimodalLiveSpeechConfig]
    def initialize(voice_config:, additional_properties: nil)
      @voice_config = voice_config
      @additional_properties = additional_properties
      @_field_set = { "voiceConfig": voice_config }
    end
# Deserialize a JSON object to an instance of GeminiMultimodalLiveSpeechConfig
    #
    # @param json_object [String] 
    # @return [Vapi::GeminiMultimodalLiveSpeechConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["voiceConfig"].nil?
        voice_config = parsed_json["voiceConfig"].to_json
        voice_config = Vapi::GeminiMultimodalLiveVoiceConfig.from_json(json_object: voice_config)
      else
        voice_config = nil
      end
      new(voice_config: voice_config, additional_properties: struct)
    end
# Serialize an instance of GeminiMultimodalLiveSpeechConfig to a JSON object
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
      Vapi::GeminiMultimodalLiveVoiceConfig.validate_raw(obj: obj.voice_config)
    end
  end
end