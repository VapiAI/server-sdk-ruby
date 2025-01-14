# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CreateTwilioCredentialDto
    # @return [String] This is not returned in the API.
    attr_reader :auth_token
    # @return [String]
    attr_reader :account_sid
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param auth_token [String] This is not returned in the API.
    # @param account_sid [String]
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateTwilioCredentialDto]
    def initialize(auth_token:, account_sid:, name: OMIT, additional_properties: nil)
      @auth_token = auth_token
      @account_sid = account_sid
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authToken": auth_token, "accountSid": account_sid, "name": name }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateTwilioCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateTwilioCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      auth_token = parsed_json["authToken"]
      account_sid = parsed_json["accountSid"]
      name = parsed_json["name"]
      new(
        auth_token: auth_token,
        account_sid: account_sid,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateTwilioCredentialDto to a JSON object
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
      obj.auth_token.is_a?(String) != false || raise("Passed value for field obj.auth_token is not the expected type, validation failed.")
      obj.account_sid.is_a?(String) != false || raise("Passed value for field obj.account_sid is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
