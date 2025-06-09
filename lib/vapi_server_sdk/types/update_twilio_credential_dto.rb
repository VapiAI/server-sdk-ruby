# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class UpdateTwilioCredentialDto
  # @return [String] This is not returned in the API.
    attr_reader :auth_token
  # @return [String] This is not returned in the API.
    attr_reader :api_key
  # @return [String] This is not returned in the API.
    attr_reader :api_secret
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [String] 
    attr_reader :account_sid
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param auth_token [String] This is not returned in the API.
    # @param api_key [String] This is not returned in the API.
    # @param api_secret [String] This is not returned in the API.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param account_sid [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateTwilioCredentialDto]
    def initialize(auth_token: OMIT, api_key: OMIT, api_secret: OMIT, name: OMIT, account_sid: OMIT, additional_properties: nil)
      @auth_token = auth_token if auth_token != OMIT
      @api_key = api_key if api_key != OMIT
      @api_secret = api_secret if api_secret != OMIT
      @name = name if name != OMIT
      @account_sid = account_sid if account_sid != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authToken": auth_token, "apiKey": api_key, "apiSecret": api_secret, "name": name, "accountSid": account_sid }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateTwilioCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateTwilioCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      auth_token = parsed_json["authToken"]
      api_key = parsed_json["apiKey"]
      api_secret = parsed_json["apiSecret"]
      name = parsed_json["name"]
      account_sid = parsed_json["accountSid"]
      new(
        auth_token: auth_token,
        api_key: api_key,
        api_secret: api_secret,
        name: name,
        account_sid: account_sid,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateTwilioCredentialDto to a JSON object
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
      obj.auth_token&.is_a?(String) != false || raise("Passed value for field obj.auth_token is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.api_secret&.is_a?(String) != false || raise("Passed value for field obj.api_secret is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.account_sid&.is_a?(String) != false || raise("Passed value for field obj.account_sid is not the expected type, validation failed.")
    end
  end
end