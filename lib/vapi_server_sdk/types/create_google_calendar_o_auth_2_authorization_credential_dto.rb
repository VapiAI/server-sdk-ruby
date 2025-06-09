# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CreateGoogleCalendarOAuth2AuthorizationCredentialDto
  # @return [String] The authorization ID for the OAuth2 authorization
    attr_reader :authorization_id
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param authorization_id [String] The authorization ID for the OAuth2 authorization
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateGoogleCalendarOAuth2AuthorizationCredentialDto]
    def initialize(authorization_id:, name: OMIT, additional_properties: nil)
      @authorization_id = authorization_id
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authorizationId": authorization_id, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CreateGoogleCalendarOAuth2AuthorizationCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateGoogleCalendarOAuth2AuthorizationCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      authorization_id = parsed_json["authorizationId"]
      name = parsed_json["name"]
      new(
        authorization_id: authorization_id,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateGoogleCalendarOAuth2AuthorizationCredentialDto to
#  a JSON object
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
      obj.authorization_id.is_a?(String) != false || raise("Passed value for field obj.authorization_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end