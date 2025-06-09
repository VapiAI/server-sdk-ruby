# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class VoiceCost
  # @return [Hash{String => Object}] This is the voice that was used during the call.
#  This matches one of the following:
#  - `call.assistant.voice`,
#  - `call.assistantId->voice`,
#  - `call.squad[n].assistant.voice`,
#  - `call.squad[n].assistantId->voice`,
#  - `call.squadId->[n].assistant.voice`,
#  - `call.squadId->[n].assistantId->voice`.
    attr_reader :voice
  # @return [Float] This is the number of characters that were generated during the call. These
#  should be total characters used in the call for single assistant calls, while
#  squad calls will have multiple voice costs one for each assistant that was used.
    attr_reader :characters
  # @return [Float] This is the cost of the component in USD.
    attr_reader :cost
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice [Hash{String => Object}] This is the voice that was used during the call.
#  This matches one of the following:
#  - `call.assistant.voice`,
#  - `call.assistantId->voice`,
#  - `call.squad[n].assistant.voice`,
#  - `call.squad[n].assistantId->voice`,
#  - `call.squadId->[n].assistant.voice`,
#  - `call.squadId->[n].assistantId->voice`.
    # @param characters [Float] This is the number of characters that were generated during the call. These
#  should be total characters used in the call for single assistant calls, while
#  squad calls will have multiple voice costs one for each assistant that was used.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VoiceCost]
    def initialize(voice:, characters:, cost:, additional_properties: nil)
      @voice = voice
      @characters = characters
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "voice": voice, "characters": characters, "cost": cost }
    end
# Deserialize a JSON object to an instance of VoiceCost
    #
    # @param json_object [String] 
    # @return [Vapi::VoiceCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voice = parsed_json["voice"]
      characters = parsed_json["characters"]
      cost = parsed_json["cost"]
      new(
        voice: voice,
        characters: characters,
        cost: cost,
        additional_properties: struct
      )
    end
# Serialize an instance of VoiceCost to a JSON object
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
      obj.voice.is_a?(Hash) != false || raise("Passed value for field obj.voice is not the expected type, validation failed.")
      obj.characters.is_a?(Float) != false || raise("Passed value for field obj.characters is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end