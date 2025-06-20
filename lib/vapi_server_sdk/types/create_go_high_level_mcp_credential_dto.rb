# frozen_string_literal: true
require_relative "oauth_2_authentication_session"
require "ostruct"
require "json"

module Vapi
  class CreateGoHighLevelMcpCredentialDto
  # @return [Vapi::Oauth2AuthenticationSession] This is the authentication session for the credential.
    attr_reader :authentication_session
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param authentication_session [Vapi::Oauth2AuthenticationSession] This is the authentication session for the credential.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateGoHighLevelMcpCredentialDto]
    def initialize(authentication_session:, name: OMIT, additional_properties: nil)
      @authentication_session = authentication_session
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authenticationSession": authentication_session, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateGoHighLevelMcpCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateGoHighLevelMcpCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["authenticationSession"].nil?
        authentication_session = parsed_json["authenticationSession"].to_json
        authentication_session = Vapi::Oauth2AuthenticationSession.from_json(json_object: authentication_session)
      else
        authentication_session = nil
      end
      name = parsed_json["name"]
      new(
        authentication_session: authentication_session,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateGoHighLevelMcpCredentialDto to a JSON object
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
      Vapi::Oauth2AuthenticationSession.validate_raw(obj: obj.authentication_session)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end