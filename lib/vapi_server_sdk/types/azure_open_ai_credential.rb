# frozen_string_literal: true
require_relative "azure_open_ai_credential_region"
require_relative "azure_open_ai_credential_models_item"
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class AzureOpenAiCredential
  # @return [String] 
    attr_reader :provider
  # @return [Vapi::AzureOpenAiCredentialRegion] 
    attr_reader :region
  # @return [Array<Vapi::AzureOpenAiCredentialModelsItem>] 
    attr_reader :models
  # @return [String] This is not returned in the API.
    attr_reader :open_ai_key
  # @return [String] This is not returned in the API.
    attr_reader :ocp_apim_subscription_key
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
    attr_reader :open_ai_endpoint
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param region [Vapi::AzureOpenAiCredentialRegion] 
    # @param models [Array<Vapi::AzureOpenAiCredentialModelsItem>] 
    # @param open_ai_key [String] This is not returned in the API.
    # @param ocp_apim_subscription_key [String] This is not returned in the API.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param open_ai_endpoint [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AzureOpenAiCredential]
    def initialize(provider:, region:, models:, open_ai_key:, ocp_apim_subscription_key: OMIT, id:, org_id:, created_at:, updated_at:, name: OMIT, open_ai_endpoint:, additional_properties: nil)
      @provider = provider
      @region = region
      @models = models
      @open_ai_key = open_ai_key
      @ocp_apim_subscription_key = ocp_apim_subscription_key if ocp_apim_subscription_key != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @open_ai_endpoint = open_ai_endpoint
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "region": region, "models": models, "openAIKey": open_ai_key, "ocpApimSubscriptionKey": ocp_apim_subscription_key, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "openAIEndpoint": open_ai_endpoint }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AzureOpenAiCredential
    #
    # @param json_object [String] 
    # @return [Vapi::AzureOpenAiCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      region = parsed_json["region"]
      models = parsed_json["models"]
      open_ai_key = parsed_json["openAIKey"]
      ocp_apim_subscription_key = parsed_json["ocpApimSubscriptionKey"]
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
      open_ai_endpoint = parsed_json["openAIEndpoint"]
      new(
        provider: provider,
        region: region,
        models: models,
        open_ai_key: open_ai_key,
        ocp_apim_subscription_key: ocp_apim_subscription_key,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        open_ai_endpoint: open_ai_endpoint,
        additional_properties: struct
      )
    end
# Serialize an instance of AzureOpenAiCredential to a JSON object
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
      obj.region.is_a?(Vapi::AzureOpenAiCredentialRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.models.is_a?(Array) != false || raise("Passed value for field obj.models is not the expected type, validation failed.")
      obj.open_ai_key.is_a?(String) != false || raise("Passed value for field obj.open_ai_key is not the expected type, validation failed.")
      obj.ocp_apim_subscription_key&.is_a?(String) != false || raise("Passed value for field obj.ocp_apim_subscription_key is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.open_ai_endpoint.is_a?(String) != false || raise("Passed value for field obj.open_ai_endpoint is not the expected type, validation failed.")
    end
  end
end