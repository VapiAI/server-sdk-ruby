# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class VoiceLibraryVoiceResponse
  # @return [String] 
    attr_reader :voice_id
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :public_owner_id
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :gender
  # @return [Hash{String => Object}] 
    attr_reader :age
  # @return [String] 
    attr_reader :accent
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_id [String] 
    # @param name [String] 
    # @param public_owner_id [String] 
    # @param description [String] 
    # @param gender [String] 
    # @param age [Hash{String => Object}] 
    # @param accent [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VoiceLibraryVoiceResponse]
    def initialize(voice_id:, name:, public_owner_id: OMIT, description: OMIT, gender: OMIT, age: OMIT, accent: OMIT, additional_properties: nil)
      @voice_id = voice_id
      @name = name
      @public_owner_id = public_owner_id if public_owner_id != OMIT
      @description = description if description != OMIT
      @gender = gender if gender != OMIT
      @age = age if age != OMIT
      @accent = accent if accent != OMIT
      @additional_properties = additional_properties
      @_field_set = { "voiceId": voice_id, "name": name, "publicOwnerId": public_owner_id, "description": description, "gender": gender, "age": age, "accent": accent }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VoiceLibraryVoiceResponse
    #
    # @param json_object [String] 
    # @return [Vapi::VoiceLibraryVoiceResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voice_id = parsed_json["voiceId"]
      name = parsed_json["name"]
      public_owner_id = parsed_json["publicOwnerId"]
      description = parsed_json["description"]
      gender = parsed_json["gender"]
      age = parsed_json["age"]
      accent = parsed_json["accent"]
      new(
        voice_id: voice_id,
        name: name,
        public_owner_id: public_owner_id,
        description: description,
        gender: gender,
        age: age,
        accent: accent,
        additional_properties: struct
      )
    end
# Serialize an instance of VoiceLibraryVoiceResponse to a JSON object
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
      obj.voice_id.is_a?(String) != false || raise("Passed value for field obj.voice_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.public_owner_id&.is_a?(String) != false || raise("Passed value for field obj.public_owner_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.gender&.is_a?(String) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
      obj.age&.is_a?(Hash) != false || raise("Passed value for field obj.age is not the expected type, validation failed.")
      obj.accent&.is_a?(String) != false || raise("Passed value for field obj.accent is not the expected type, validation failed.")
    end
  end
end