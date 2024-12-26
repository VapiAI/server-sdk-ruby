# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class Oauth2AuthenticationSession
    # @return [String] This is the OAuth2 access token.
    attr_reader :access_token
    # @return [DateTime] This is the OAuth2 access token expiration.
    attr_reader :expires_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param access_token [String] This is the OAuth2 access token.
    # @param expires_at [DateTime] This is the OAuth2 access token expiration.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Oauth2AuthenticationSession]
    def initialize(access_token: OMIT, expires_at: OMIT, additional_properties: nil)
      @access_token = access_token if access_token != OMIT
      @expires_at = expires_at if expires_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "accessToken": access_token, "expiresAt": expires_at }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Oauth2AuthenticationSession
    #
    # @param json_object [String]
    # @return [Vapi::Oauth2AuthenticationSession]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      access_token = parsed_json["accessToken"]
      expires_at = (DateTime.parse(parsed_json["expiresAt"]) unless parsed_json["expiresAt"].nil?)
      new(
        access_token: access_token,
        expires_at: expires_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of Oauth2AuthenticationSession to a JSON object
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
      obj.access_token&.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      obj.expires_at&.is_a?(DateTime) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
    end
  end
end
