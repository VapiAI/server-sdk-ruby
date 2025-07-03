# frozen_string_literal: true
require_relative "create_azure_credential_dto_service"
require_relative "create_azure_credential_dto_region"
require_relative "azure_blob_storage_bucket_plan"
require "ostruct"
require "json"

module Vapi
  class CreateAzureCredentialDto
  # @return [Vapi::CreateAzureCredentialDtoService] This is the service being used in Azure.
    attr_reader :service
  # @return [Vapi::CreateAzureCredentialDtoRegion] This is the region of the Azure resource.
    attr_reader :region
  # @return [String] This is not returned in the API.
    attr_reader :api_key
  # @return [Float] This is the order in which this storage provider is tried during upload retries.
#  Lower numbers are tried first in increasing order.
    attr_reader :fallback_index
  # @return [Vapi::AzureBlobStorageBucketPlan] This is the bucket plan that can be provided to store call artifacts in Azure
#  Blob Storage.
    attr_reader :bucket_plan
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param service [Vapi::CreateAzureCredentialDtoService] This is the service being used in Azure.
    # @param region [Vapi::CreateAzureCredentialDtoRegion] This is the region of the Azure resource.
    # @param api_key [String] This is not returned in the API.
    # @param fallback_index [Float] This is the order in which this storage provider is tried during upload retries.
#  Lower numbers are tried first in increasing order.
    # @param bucket_plan [Vapi::AzureBlobStorageBucketPlan] This is the bucket plan that can be provided to store call artifacts in Azure
#  Blob Storage.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateAzureCredentialDto]
    def initialize(service:, region: OMIT, api_key: OMIT, fallback_index: OMIT, bucket_plan: OMIT, name: OMIT, additional_properties: nil)
      @service = service
      @region = region if region != OMIT
      @api_key = api_key if api_key != OMIT
      @fallback_index = fallback_index if fallback_index != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "service": service, "region": region, "apiKey": api_key, "fallbackIndex": fallback_index, "bucketPlan": bucket_plan, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateAzureCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateAzureCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      service = parsed_json["service"]
      region = parsed_json["region"]
      api_key = parsed_json["apiKey"]
      fallback_index = parsed_json["fallbackIndex"]
      unless parsed_json["bucketPlan"].nil?
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::AzureBlobStorageBucketPlan.from_json(json_object: bucket_plan)
      else
        bucket_plan = nil
      end
      name = parsed_json["name"]
      new(
        service: service,
        region: region,
        api_key: api_key,
        fallback_index: fallback_index,
        bucket_plan: bucket_plan,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateAzureCredentialDto to a JSON object
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
      obj.service.is_a?(Vapi::CreateAzureCredentialDtoService) != false || raise("Passed value for field obj.service is not the expected type, validation failed.")
      obj.region&.is_a?(Vapi::CreateAzureCredentialDtoRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.fallback_index&.is_a?(Float) != false || raise("Passed value for field obj.fallback_index is not the expected type, validation failed.")
      obj.bucket_plan.nil? || Vapi::AzureBlobStorageBucketPlan.validate_raw(obj: obj.bucket_plan)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end