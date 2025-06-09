# frozen_string_literal: true
require_relative "gemini_multimodal_live_prebuilt_voice_config"
require "ostruct"
require "json"

module Vapi
  class GeminiMultimodalLiveVoiceConfig
  # @return [Vapi::GeminiMultimodalLivePrebuiltVoiceConfig] 
    attr_reader :prebuilt_voice_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param prebuilt_voice_config [Vapi::GeminiMultimodalLivePrebuiltVoiceConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GeminiMultimodalLiveVoiceConfig]
    def initialize(prebuilt_voice_config:, additional_properties: nil)
      @prebuilt_voice_config = prebuilt_voice_config
      @additional_properties = additional_properties
      @_field_set = { "prebuiltVoiceConfig": prebuilt_voice_config }
    end
# Deserialize a JSON object to an instance of GeminiMultimodalLiveVoiceConfig
    #
    # @param json_object [String] 
    # @return [Vapi::GeminiMultimodalLiveVoiceConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["prebuiltVoiceConfig"].nil?
        prebuilt_voice_config = parsed_json["prebuiltVoiceConfig"].to_json
        prebuilt_voice_config = Vapi::GeminiMultimodalLivePrebuiltVoiceConfig.from_json(json_object: prebuilt_voice_config)
      else
        prebuilt_voice_config = nil
      end
      new(prebuilt_voice_config: prebuilt_voice_config, additional_properties: struct)
    end
# Serialize an instance of GeminiMultimodalLiveVoiceConfig to a JSON object
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
      Vapi::GeminiMultimodalLivePrebuiltVoiceConfig.validate_raw(obj: obj.prebuilt_voice_config)
    end
  end
end