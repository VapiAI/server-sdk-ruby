# frozen_string_literal: true
require_relative "gcp_key"
require_relative "bucket_plan"
require "ostruct"
require "json"

module Vapi
  class UpdateGcpCredentialDto
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [Vapi::GcpKey] This is the GCP key. This is the JSON that can be generated in the Google Cloud
#  Console at
#  le.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
#  The schema is identical to the JSON that GCP outputs.
    attr_reader :gcp_key
  # @return [Vapi::BucketPlan] This is the bucket plan that can be provided to store call artifacts in GCP.
    attr_reader :bucket_plan
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of credential. This is just for your reference.
    # @param gcp_key [Vapi::GcpKey] This is the GCP key. This is the JSON that can be generated in the Google Cloud
#  Console at
#  le.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
#  The schema is identical to the JSON that GCP outputs.
    # @param bucket_plan [Vapi::BucketPlan] This is the bucket plan that can be provided to store call artifacts in GCP.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateGcpCredentialDto]
    def initialize(name: OMIT, gcp_key: OMIT, bucket_plan: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @gcp_key = gcp_key if gcp_key != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "gcpKey": gcp_key, "bucketPlan": bucket_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateGcpCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateGcpCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["gcpKey"].nil?
        gcp_key = parsed_json["gcpKey"].to_json
        gcp_key = Vapi::GcpKey.from_json(json_object: gcp_key)
      else
        gcp_key = nil
      end
      unless parsed_json["bucketPlan"].nil?
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::BucketPlan.from_json(json_object: bucket_plan)
      else
        bucket_plan = nil
      end
      new(
        name: name,
        gcp_key: gcp_key,
        bucket_plan: bucket_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateGcpCredentialDto to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.gcp_key.nil? || Vapi::GcpKey.validate_raw(obj: obj.gcp_key)
      obj.bucket_plan.nil? || Vapi::BucketPlan.validate_raw(obj: obj.bucket_plan)
    end
  end
end