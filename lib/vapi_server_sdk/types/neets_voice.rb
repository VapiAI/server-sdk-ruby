# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class NeetsVoice
    # @return [Object]
    attr_reader :voice_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_id [Object]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::NeetsVoice]
    def initialize(voice_id: OMIT, additional_properties: nil)
      @voice_id = voice_id if voice_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "voiceId": voice_id }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of NeetsVoice
    #
    # @param json_object [String]
    # @return [Vapi::NeetsVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voice_id = parsed_json["voiceId"]
      new(voice_id: voice_id, additional_properties: struct)
    end

    # Serialize an instance of NeetsVoice to a JSON object
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
      obj.voice_id&.is_a?(Object) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
    end
  end
end
