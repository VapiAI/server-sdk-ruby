# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class VonageCredential
    # @return [String] This is not returned in the API.
    attr_reader :vonage_application_private_key
    # @return [String]
    attr_reader :provider
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
    # @return [String] This is the Vonage Application ID for the credential.
    #  Only relevant for Vonage credentials.
    attr_reader :vonage_application_id
    # @return [String]
    attr_reader :api_key
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param vonage_application_private_key [String] This is not returned in the API.
    # @param provider [String]
    # @param api_secret [String] This is not returned in the API.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param vonage_application_id [String] This is the Vonage Application ID for the credential.
    #  Only relevant for Vonage credentials.
    # @param api_key [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VonageCredential]
    def initialize(vonage_application_private_key:, provider:, api_secret:, id:, org_id:, created_at:, updated_at:,
                   vonage_application_id:, api_key:, additional_properties: nil)
      @vonage_application_private_key = vonage_application_private_key
      @provider = provider
      @api_secret = api_secret
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @vonage_application_id = vonage_application_id
      @api_key = api_key
      @additional_properties = additional_properties
      @_field_set = {
        "vonageApplicationPrivateKey": vonage_application_private_key,
        "provider": provider,
        "apiSecret": api_secret,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "vonageApplicationId": vonage_application_id,
        "apiKey": api_key
      }
    end

    # Deserialize a JSON object to an instance of VonageCredential
    #
    # @param json_object [String]
    # @return [Vapi::VonageCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      vonage_application_private_key = parsed_json["vonageApplicationPrivateKey"]
      provider = parsed_json["provider"]
      api_secret = parsed_json["apiSecret"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      vonage_application_id = parsed_json["vonageApplicationId"]
      api_key = parsed_json["apiKey"]
      new(
        vonage_application_private_key: vonage_application_private_key,
        provider: provider,
        api_secret: api_secret,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        vonage_application_id: vonage_application_id,
        api_key: api_key,
        additional_properties: struct
      )
    end

    # Serialize an instance of VonageCredential to a JSON object
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
      obj.vonage_application_private_key.is_a?(String) != false || raise("Passed value for field obj.vonage_application_private_key is not the expected type, validation failed.")
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.api_secret.is_a?(String) != false || raise("Passed value for field obj.api_secret is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.vonage_application_id.is_a?(String) != false || raise("Passed value for field obj.vonage_application_id is not the expected type, validation failed.")
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
    end
  end
end
