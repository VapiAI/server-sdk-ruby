# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class BucketPlan
  # @return [String] This is the name of the bucket.
    attr_reader :name
  # @return [String] This is the region of the bucket.
#  Usage:
#  - If `credential.type` is `aws`, then this is required.
#  - If `credential.type` is `gcp`, then this is optional since GCP allows buckets
#  to be accessed without a region but region is required for data residency
#  requirements. Read here: https://cloud.google.com/storage/docs/request-endpoints
    attr_reader :region
  # @return [String] This is the path where call artifacts will be stored.
#  Usage:
#  - To store call artifacts in a specific folder, set this to the full path. Eg.
#  "/folder-name1/folder-name2".
#  - To store call artifacts in the root of the bucket, leave this blank.
#  @default "/"
    attr_reader :path
  # @return [String] This is the HMAC access key offered by GCP for interoperability with S3 clients.
#  Here is the guide on how to create:
#  https://cloud.google.com/storage/docs/authentication/managing-hmackeys#console
#  Usage:
#  - If `credential.type` is `gcp`, then this is required.
#  - If `credential.type` is `aws`, then this is not required since
#  credential.awsAccessKeyId is used instead.
    attr_reader :hmac_access_key
  # @return [String] This is the secret for the HMAC access key. Here is the guide on how to create:
#  https://cloud.google.com/storage/docs/authentication/managing-hmackeys#console
#  Usage:
#  - If `credential.type` is `gcp`, then this is required.
#  - If `credential.type` is `aws`, then this is not required since
#  credential.awsSecretAccessKey is used instead.
#  Note: This is not returned in the API.
    attr_reader :hmac_secret
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the bucket.
    # @param region [String] This is the region of the bucket.
#  Usage:
#  - If `credential.type` is `aws`, then this is required.
#  - If `credential.type` is `gcp`, then this is optional since GCP allows buckets
#  to be accessed without a region but region is required for data residency
#  requirements. Read here: https://cloud.google.com/storage/docs/request-endpoints
    # @param path [String] This is the path where call artifacts will be stored.
#  Usage:
#  - To store call artifacts in a specific folder, set this to the full path. Eg.
#  "/folder-name1/folder-name2".
#  - To store call artifacts in the root of the bucket, leave this blank.
#  @default "/"
    # @param hmac_access_key [String] This is the HMAC access key offered by GCP for interoperability with S3 clients.
#  Here is the guide on how to create:
#  https://cloud.google.com/storage/docs/authentication/managing-hmackeys#console
#  Usage:
#  - If `credential.type` is `gcp`, then this is required.
#  - If `credential.type` is `aws`, then this is not required since
#  credential.awsAccessKeyId is used instead.
    # @param hmac_secret [String] This is the secret for the HMAC access key. Here is the guide on how to create:
#  https://cloud.google.com/storage/docs/authentication/managing-hmackeys#console
#  Usage:
#  - If `credential.type` is `gcp`, then this is required.
#  - If `credential.type` is `aws`, then this is not required since
#  credential.awsSecretAccessKey is used instead.
#  Note: This is not returned in the API.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BucketPlan]
    def initialize(name:, region: OMIT, path: OMIT, hmac_access_key: OMIT, hmac_secret: OMIT, additional_properties: nil)
      @name = name
      @region = region if region != OMIT
      @path = path if path != OMIT
      @hmac_access_key = hmac_access_key if hmac_access_key != OMIT
      @hmac_secret = hmac_secret if hmac_secret != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "region": region, "path": path, "hmacAccessKey": hmac_access_key, "hmacSecret": hmac_secret }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BucketPlan
    #
    # @param json_object [String] 
    # @return [Vapi::BucketPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      region = parsed_json["region"]
      path = parsed_json["path"]
      hmac_access_key = parsed_json["hmacAccessKey"]
      hmac_secret = parsed_json["hmacSecret"]
      new(
        name: name,
        region: region,
        path: path,
        hmac_access_key: hmac_access_key,
        hmac_secret: hmac_secret,
        additional_properties: struct
      )
    end
# Serialize an instance of BucketPlan to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.region&.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.path&.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
      obj.hmac_access_key&.is_a?(String) != false || raise("Passed value for field obj.hmac_access_key is not the expected type, validation failed.")
      obj.hmac_secret&.is_a?(String) != false || raise("Passed value for field obj.hmac_secret is not the expected type, validation failed.")
    end
  end
end