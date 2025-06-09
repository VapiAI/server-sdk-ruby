# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class SipAuthentication
  # @return [String] This will be expected in the `realm` field of the `authorization` header of the
#  SIP INVITE. Defaults to sip.vapi.ai.
    attr_reader :realm
  # @return [String] This will be expected in the `username` field of the `authorization` header of
#  the SIP INVITE.
    attr_reader :username
  # @return [String] This will be expected to generate the `response` field of the `authorization`
#  header of the SIP INVITE, through digest authentication.
    attr_reader :password
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param realm [String] This will be expected in the `realm` field of the `authorization` header of the
#  SIP INVITE. Defaults to sip.vapi.ai.
    # @param username [String] This will be expected in the `username` field of the `authorization` header of
#  the SIP INVITE.
    # @param password [String] This will be expected to generate the `response` field of the `authorization`
#  header of the SIP INVITE, through digest authentication.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SipAuthentication]
    def initialize(realm: OMIT, username:, password:, additional_properties: nil)
      @realm = realm if realm != OMIT
      @username = username
      @password = password
      @additional_properties = additional_properties
      @_field_set = { "realm": realm, "username": username, "password": password }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SipAuthentication
    #
    # @param json_object [String] 
    # @return [Vapi::SipAuthentication]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      realm = parsed_json["realm"]
      username = parsed_json["username"]
      password = parsed_json["password"]
      new(
        realm: realm,
        username: username,
        password: password,
        additional_properties: struct
      )
    end
# Serialize an instance of SipAuthentication to a JSON object
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
      obj.realm&.is_a?(String) != false || raise("Passed value for field obj.realm is not the expected type, validation failed.")
      obj.username.is_a?(String) != false || raise("Passed value for field obj.username is not the expected type, validation failed.")
      obj.password.is_a?(String) != false || raise("Passed value for field obj.password is not the expected type, validation failed.")
    end
  end
end