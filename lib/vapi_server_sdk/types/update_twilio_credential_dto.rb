# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class UpdateTwilioCredentialDto
    # @return [String]
    attr_reader :provider
    # @return [String] This is not returned in the API.
    attr_reader :auth_token
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
    # @param account_sid [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateTwilioCredentialDto]
    def initialize(provider:, auth_token:, account_sid:, additional_properties: nil)
      @provider = provider
      @auth_token = auth_token
      @account_sid = account_sid
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "authToken": auth_token, "accountSid": account_sid }
    end

    # Deserialize a JSON object to an instance of UpdateTwilioCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateTwilioCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      auth_token = parsed_json["authToken"]
      account_sid = parsed_json["accountSid"]
      new(
        provider: provider,
        auth_token: auth_token,
        account_sid: account_sid,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateTwilioCredentialDto to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.auth_token.is_a?(String) != false || raise("Passed value for field obj.auth_token is not the expected type, validation failed.")
      obj.account_sid.is_a?(String) != false || raise("Passed value for field obj.account_sid is not the expected type, validation failed.")
    end
  end
end