# frozen_string_literal: true
require_relative "o_auth_2_authentication_plan"
require "date"
require "date"
require_relative "oauth_2_authentication_session"
require "ostruct"
require "json"

module Vapi
  class CustomLlmCredential
  # @return [String] 
    attr_reader :provider
  # @return [String] This is not returned in the API.
    attr_reader :api_key
  # @return [Vapi::OAuth2AuthenticationPlan] This is the authentication plan. Currently supports OAuth2 RFC 6749. To use
#  Bearer authentication, use apiKey
    attr_reader :authentication_plan
  # @return [String] This is the unique identifier for the credential.
    attr_reader :id
  # @return [String] This is the unique identifier for the org that this credential belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    attr_reader :updated_at
  # @return [Vapi::Oauth2AuthenticationSession] This is the authentication session for the credential. Available for credentials
#  that have an authentication plan.
    attr_reader :authentication_session
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param api_key [String] This is not returned in the API.
    # @param authentication_plan [Vapi::OAuth2AuthenticationPlan] This is the authentication plan. Currently supports OAuth2 RFC 6749. To use
#  Bearer authentication, use apiKey
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param authentication_session [Vapi::Oauth2AuthenticationSession] This is the authentication session for the credential. Available for credentials
#  that have an authentication plan.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomLlmCredential]
    def initialize(provider:, api_key:, authentication_plan: OMIT, id:, org_id:, created_at:, updated_at:, authentication_session: OMIT, name: OMIT, additional_properties: nil)
      @provider = provider
      @api_key = api_key
      @authentication_plan = authentication_plan if authentication_plan != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @authentication_session = authentication_session if authentication_session != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "apiKey": api_key, "authenticationPlan": authentication_plan, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "authenticationSession": authentication_session, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomLlmCredential
    #
    # @param json_object [String] 
    # @return [Vapi::CustomLlmCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      api_key = parsed_json["apiKey"]
      unless parsed_json["authenticationPlan"].nil?
        authentication_plan = parsed_json["authenticationPlan"].to_json
        authentication_plan = Vapi::OAuth2AuthenticationPlan.from_json(json_object: authentication_plan)
      else
        authentication_plan = nil
      end
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
      unless parsed_json["authenticationSession"].nil?
        authentication_session = parsed_json["authenticationSession"].to_json
        authentication_session = Vapi::Oauth2AuthenticationSession.from_json(json_object: authentication_session)
      else
        authentication_session = nil
      end
      name = parsed_json["name"]
      new(
        provider: provider,
        api_key: api_key,
        authentication_plan: authentication_plan,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        authentication_session: authentication_session,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomLlmCredential to a JSON object
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
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.authentication_plan.nil? || Vapi::OAuth2AuthenticationPlan.validate_raw(obj: obj.authentication_plan)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.authentication_session.nil? || Vapi::Oauth2AuthenticationSession.validate_raw(obj: obj.authentication_session)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end