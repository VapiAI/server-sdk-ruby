# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class GoogleSheetsOAuth2AuthorizationCredential
  # @return [String] 
    attr_reader :provider
  # @return [String] The authorization ID for the OAuth2 authorization
    attr_reader :authorization_id
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
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param authorization_id [String] The authorization ID for the OAuth2 authorization
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GoogleSheetsOAuth2AuthorizationCredential]
    def initialize(provider:, authorization_id:, id:, org_id:, created_at:, updated_at:, name: OMIT, additional_properties: nil)
      @provider = provider
      @authorization_id = authorization_id
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "authorizationId": authorization_id, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  GoogleSheetsOAuth2AuthorizationCredential
    #
    # @param json_object [String] 
    # @return [Vapi::GoogleSheetsOAuth2AuthorizationCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      authorization_id = parsed_json["authorizationId"]
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
      new(
        provider: provider,
        authorization_id: authorization_id,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of GoogleSheetsOAuth2AuthorizationCredential to a JSON
#  object
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
      obj.authorization_id.is_a?(String) != false || raise("Passed value for field obj.authorization_id is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end