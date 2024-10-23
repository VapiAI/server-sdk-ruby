# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AddVoiceToProviderDto
    # @return [String] This is the owner_id of your shared voice which you want to add to your provider
    #  Account from Provider Voice Library
    attr_reader :owner_id
    # @return [String] This is the voice_id of the shared voice which you want to add to your provider
    #  Account from Provider Voice Library
    attr_reader :voice_id
    # @return [String] This is the new name of the voice which you want to have once you have added
    #  voice to your provider Account from Provider Voice Library
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param owner_id [String] This is the owner_id of your shared voice which you want to add to your provider
    #  Account from Provider Voice Library
    # @param voice_id [String] This is the voice_id of the shared voice which you want to add to your provider
    #  Account from Provider Voice Library
    # @param name [String] This is the new name of the voice which you want to have once you have added
    #  voice to your provider Account from Provider Voice Library
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AddVoiceToProviderDto]
    def initialize(owner_id:, voice_id:, name:, additional_properties: nil)
      @owner_id = owner_id
      @voice_id = voice_id
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "ownerId": owner_id, "voiceId": voice_id, "name": name }
    end

    # Deserialize a JSON object to an instance of AddVoiceToProviderDto
    #
    # @param json_object [String]
    # @return [Vapi::AddVoiceToProviderDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      owner_id = parsed_json["ownerId"]
      voice_id = parsed_json["voiceId"]
      name = parsed_json["name"]
      new(
        owner_id: owner_id,
        voice_id: voice_id,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of AddVoiceToProviderDto to a JSON object
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
      obj.owner_id.is_a?(String) != false || raise("Passed value for field obj.owner_id is not the expected type, validation failed.")
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
