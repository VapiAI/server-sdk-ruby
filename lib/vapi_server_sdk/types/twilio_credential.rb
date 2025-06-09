# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class TwilioCredential
  # @return [String] 
    attr_reader :provider
  # @return [String] This is not returned in the API.
    attr_reader :auth_token
  # @return [String] This is not returned in the API.
    attr_reader :api_key
  # @return [String] This is not returned in the API.
    attr_reader :api_secret
  # @return [String] This is the unique identifier for the credential.
    attr_reader :id
  # @return [String] This is the unique identifier for the org that this credential belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    attr_reader :updated_at
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

    # @param provider [String] 
    # @param auth_token [String] This is not returned in the API.
    # @param api_key [String] This is not returned in the API.
    # @param api_secret [String] This is not returned in the API.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param account_sid [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TwilioCredential]
    def initialize(provider:, auth_token: OMIT, api_key: OMIT, api_secret: OMIT, id:, org_id:, created_at:, updated_at:, name: OMIT, account_sid:, additional_properties: nil)
      @provider = provider
      @auth_token = auth_token if auth_token != OMIT
      @api_key = api_key if api_key != OMIT
      @api_secret = api_secret if api_secret != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @account_sid = account_sid
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "authToken": auth_token, "apiKey": api_key, "apiSecret": api_secret, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "accountSid": account_sid }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TwilioCredential
    #
    # @param json_object [String] 
    # @return [Vapi::TwilioCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      auth_token = parsed_json["authToken"]
      api_key = parsed_json["apiKey"]
      api_secret = parsed_json["apiSecret"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      name = parsed_json["name"]
      account_sid = parsed_json["accountSid"]
      new(
        provider: provider,
        auth_token: auth_token,
        api_key: api_key,
        api_secret: api_secret,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        account_sid: account_sid,
        additional_properties: struct
      )
    end
# Serialize an instance of TwilioCredential to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.auth_token&.is_a?(String) != false || raise("Passed value for field obj.auth_token is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.api_secret&.is_a?(String) != false || raise("Passed value for field obj.api_secret is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.account_sid.is_a?(String) != false || raise("Passed value for field obj.account_sid is not the expected type, validation failed.")
    end
  end
end