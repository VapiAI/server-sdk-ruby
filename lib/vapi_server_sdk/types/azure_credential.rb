# frozen_string_literal: true

require_relative "azure_credential_service"
require_relative "azure_credential_region"
require "date"
require_relative "azure_blob_storage_bucket_plan"
require "ostruct"
require "json"

module Vapi
  class AzureCredential
    # @return [String]
    attr_reader :provider
    # @return [Vapi::AzureCredentialService] This is the service being used in Azure.
    attr_reader :service
    # @return [Vapi::AzureCredentialRegion] This is the region of the Azure resource.
    attr_reader :region
    # @return [String] This is not returned in the API.
    attr_reader :api_key
    # @return [Float] This is the order in which this storage provider is tried during upload retries.
    #  Lower numbers are tried first in increasing order.
    attr_reader :fallback_index
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
    # @return [Vapi::AzureBlobStorageBucketPlan] This is the bucket plan that can be provided to store call artifacts in Azure
    #  Blob Storage.
    attr_reader :bucket_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param service [Vapi::AzureCredentialService] This is the service being used in Azure.
    # @param region [Vapi::AzureCredentialRegion] This is the region of the Azure resource.
    # @param api_key [String] This is not returned in the API.
    # @param fallback_index [Float] This is the order in which this storage provider is tried during upload retries.
    #  Lower numbers are tried first in increasing order.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param bucket_plan [Vapi::AzureBlobStorageBucketPlan] This is the bucket plan that can be provided to store call artifacts in Azure
    #  Blob Storage.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AzureCredential]
    def initialize(provider:, service:, id:, org_id:, created_at:, updated_at:, region: OMIT, api_key: OMIT,
                   fallback_index: OMIT, name: OMIT, bucket_plan: OMIT, additional_properties: nil)
      @provider = provider
      @service = service
      @region = region if region != OMIT
      @api_key = api_key if api_key != OMIT
      @fallback_index = fallback_index if fallback_index != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "service": service,
        "region": region,
        "apiKey": api_key,
        "fallbackIndex": fallback_index,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "bucketPlan": bucket_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AzureCredential
    #
    # @param json_object [String]
    # @return [Vapi::AzureCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      service = parsed_json["service"]
      region = parsed_json["region"]
      api_key = parsed_json["apiKey"]
      fallback_index = parsed_json["fallbackIndex"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      if parsed_json["bucketPlan"].nil?
        bucket_plan = nil
      else
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::AzureBlobStorageBucketPlan.from_json(json_object: bucket_plan)
      end
      new(
        provider: provider,
        service: service,
        region: region,
        api_key: api_key,
        fallback_index: fallback_index,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        bucket_plan: bucket_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of AzureCredential to a JSON object
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
      obj.service.is_a?(Vapi::AzureCredentialService) != false || raise("Passed value for field obj.service is not the expected type, validation failed.")
      obj.region&.is_a?(Vapi::AzureCredentialRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.fallback_index&.is_a?(Float) != false || raise("Passed value for field obj.fallback_index is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.bucket_plan.nil? || Vapi::AzureBlobStorageBucketPlan.validate_raw(obj: obj.bucket_plan)
    end
  end
end
