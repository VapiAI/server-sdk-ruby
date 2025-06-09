# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class JwtResponse
  # @return [String] 
    attr_reader :access_token
  # @return [Hash{String => Object}] 
    attr_reader :aud
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param access_token [String] 
    # @param aud [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::JwtResponse]
    def initialize(access_token:, aud:, additional_properties: nil)
      @access_token = access_token
      @aud = aud
      @additional_properties = additional_properties
      @_field_set = { "accessToken": access_token, "aud": aud }
    end
# Deserialize a JSON object to an instance of JwtResponse
    #
    # @param json_object [String] 
    # @return [Vapi::JwtResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      access_token = parsed_json["accessToken"]
      aud = parsed_json["aud"]
      new(
        access_token: access_token,
        aud: aud,
        additional_properties: struct
      )
    end
# Serialize an instance of JwtResponse to a JSON object
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
      obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      obj.aud.is_a?(Hash) != false || raise("Passed value for field obj.aud is not the expected type, validation failed.")
    end
  end
end