# frozen_string_literal: true

require_relative "gcp_credential_provider"
require "date"
require_relative "gcp_key"
require_relative "bucket_plan"
require "ostruct"
require "json"

module Vapi
  class GcpCredential
    # @return [Vapi::GcpCredentialProvider]
    attr_reader :provider
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
    # @return [Vapi::GcpKey] This is the GCP key. This is the JSON that can be generated in the Google Cloud
    #  Console at
    #  le.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
    #  The schema is identical to the JSON that GCP outputs.
    attr_reader :gcp_key
    # @return [String] This is the region of the GCP resource.
    attr_reader :region
    # @return [Vapi::BucketPlan]
    attr_reader :bucket_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::GcpCredentialProvider]
    # @param fallback_index [Float] This is the order in which this storage provider is tried during upload retries.
    #  Lower numbers are tried first in increasing order.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param gcp_key [Vapi::GcpKey] This is the GCP key. This is the JSON that can be generated in the Google Cloud
    #  Console at
    #  le.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
    #  The schema is identical to the JSON that GCP outputs.
    # @param region [String] This is the region of the GCP resource.
    # @param bucket_plan [Vapi::BucketPlan]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GcpCredential]
    def initialize(provider:, id:, org_id:, created_at:, updated_at:, gcp_key:, fallback_index: OMIT, name: OMIT,
                   region: OMIT, bucket_plan: OMIT, additional_properties: nil)
      @provider = provider
      @fallback_index = fallback_index if fallback_index != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @gcp_key = gcp_key
      @region = region if region != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "fallbackIndex": fallback_index,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "gcpKey": gcp_key,
        "region": region,
        "bucketPlan": bucket_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GcpCredential
    #
    # @param json_object [String]
    # @return [Vapi::GcpCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      fallback_index = parsed_json["fallbackIndex"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      if parsed_json["gcpKey"].nil?
        gcp_key = nil
      else
        gcp_key = parsed_json["gcpKey"].to_json
        gcp_key = Vapi::GcpKey.from_json(json_object: gcp_key)
      end
      region = parsed_json["region"]
      if parsed_json["bucketPlan"].nil?
        bucket_plan = nil
      else
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::BucketPlan.from_json(json_object: bucket_plan)
      end
      new(
        provider: provider,
        fallback_index: fallback_index,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        gcp_key: gcp_key,
        region: region,
        bucket_plan: bucket_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of GcpCredential to a JSON object
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
      obj.provider.is_a?(Vapi::GcpCredentialProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.fallback_index&.is_a?(Float) != false || raise("Passed value for field obj.fallback_index is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Vapi::GcpKey.validate_raw(obj: obj.gcp_key)
      obj.region&.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.bucket_plan.nil? || Vapi::BucketPlan.validate_raw(obj: obj.bucket_plan)
    end
  end
end
