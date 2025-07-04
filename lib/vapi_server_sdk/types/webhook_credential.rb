# frozen_string_literal: true

require_relative "webhook_credential_authentication_plan"
require "date"
require_relative "oauth_2_authentication_session"
require "ostruct"
require "json"

module Vapi
  class WebhookCredential
    # @return [String]
    attr_reader :provider
    # @return [Vapi::WebhookCredentialAuthenticationPlan] This is the authentication plan. Supports OAuth2 RFC 6749 and HMAC signing.
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
    # @param authentication_plan [Vapi::WebhookCredentialAuthenticationPlan] This is the authentication plan. Supports OAuth2 RFC 6749 and HMAC signing.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param authentication_session [Vapi::Oauth2AuthenticationSession] This is the authentication session for the credential. Available for credentials
    #  that have an authentication plan.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WebhookCredential]
    def initialize(provider:, authentication_plan:, id:, org_id:, created_at:, updated_at:, authentication_session:,
                   name: OMIT, additional_properties: nil)
      @provider = provider
      @authentication_plan = authentication_plan
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @authentication_session = authentication_session
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "authenticationPlan": authentication_plan,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "authenticationSession": authentication_session,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WebhookCredential
    #
    # @param json_object [String]
    # @return [Vapi::WebhookCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      if parsed_json["authenticationPlan"].nil?
        authentication_plan = nil
      else
        authentication_plan = parsed_json["authenticationPlan"].to_json
        authentication_plan = Vapi::WebhookCredentialAuthenticationPlan.from_json(json_object: authentication_plan)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      if parsed_json["authenticationSession"].nil?
        authentication_session = nil
      else
        authentication_session = parsed_json["authenticationSession"].to_json
        authentication_session = Vapi::Oauth2AuthenticationSession.from_json(json_object: authentication_session)
      end
      name = parsed_json["name"]
      new(
        provider: provider,
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

    # Serialize an instance of WebhookCredential to a JSON object
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
      Vapi::WebhookCredentialAuthenticationPlan.validate_raw(obj: obj.authentication_plan)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      Vapi::Oauth2AuthenticationSession.validate_raw(obj: obj.authentication_session)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
