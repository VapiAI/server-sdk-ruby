# frozen_string_literal: true
require_relative "supabase_bucket_plan_region"
require "ostruct"
require "json"

module Vapi
  class SupabaseBucketPlan
  # @return [Vapi::SupabaseBucketPlanRegion] This is the S3 Region. It should look like us-east-1
#  It should be one of the supabase regions defined in the SUPABASE_REGION enum
#  Check https://supabase.com/docs/guides/platform/regions for up to date regions
    attr_reader :region
  # @return [String] This is the S3 compatible URL for Supabase S3
#  This should look like https://<project-ID>.supabase.co/storage/v1/s3
    attr_reader :url
  # @return [String] This is the Supabase S3 Access Key ID.
#  The user creates this in the Supabase project Storage settings
    attr_reader :access_key_id
  # @return [String] This is the Supabase S3 Secret Access Key.
#  The user creates this in the Supabase project Storage settings along with the
#  access key id
    attr_reader :secret_access_key
  # @return [String] This is the Supabase S3 Bucket Name.
#  The user must create this in Supabase under Storage > Buckets
#  A bucket that does not exist will not be checked now, but file uploads will fail
    attr_reader :name
  # @return [String] This is the Supabase S3 Bucket Folder Path.
#  The user can create this in Supabase under Storage > Buckets
#  A path that does not exist will not be checked now, but file uploads will fail
#  A Path is like a folder in the bucket
#  Eg. If the bucket is called "my-bucket" and the path is "my-folder", the full
#  path is "my-bucket/my-folder"
    attr_reader :path
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param region [Vapi::SupabaseBucketPlanRegion] This is the S3 Region. It should look like us-east-1
#  It should be one of the supabase regions defined in the SUPABASE_REGION enum
#  Check https://supabase.com/docs/guides/platform/regions for up to date regions
    # @param url [String] This is the S3 compatible URL for Supabase S3
#  This should look like https://<project-ID>.supabase.co/storage/v1/s3
    # @param access_key_id [String] This is the Supabase S3 Access Key ID.
#  The user creates this in the Supabase project Storage settings
    # @param secret_access_key [String] This is the Supabase S3 Secret Access Key.
#  The user creates this in the Supabase project Storage settings along with the
#  access key id
    # @param name [String] This is the Supabase S3 Bucket Name.
#  The user must create this in Supabase under Storage > Buckets
#  A bucket that does not exist will not be checked now, but file uploads will fail
    # @param path [String] This is the Supabase S3 Bucket Folder Path.
#  The user can create this in Supabase under Storage > Buckets
#  A path that does not exist will not be checked now, but file uploads will fail
#  A Path is like a folder in the bucket
#  Eg. If the bucket is called "my-bucket" and the path is "my-folder", the full
#  path is "my-bucket/my-folder"
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SupabaseBucketPlan]
    def initialize(region:, url:, access_key_id:, secret_access_key:, name:, path: OMIT, additional_properties: nil)
      @region = region
      @url = url
      @access_key_id = access_key_id
      @secret_access_key = secret_access_key
      @name = name
      @path = path if path != OMIT
      @additional_properties = additional_properties
      @_field_set = { "region": region, "url": url, "accessKeyId": access_key_id, "secretAccessKey": secret_access_key, "name": name, "path": path }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SupabaseBucketPlan
    #
    # @param json_object [String] 
    # @return [Vapi::SupabaseBucketPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      region = parsed_json["region"]
      url = parsed_json["url"]
      access_key_id = parsed_json["accessKeyId"]
      secret_access_key = parsed_json["secretAccessKey"]
      name = parsed_json["name"]
      path = parsed_json["path"]
      new(
        region: region,
        url: url,
        access_key_id: access_key_id,
        secret_access_key: secret_access_key,
        name: name,
        path: path,
        additional_properties: struct
      )
    end
# Serialize an instance of SupabaseBucketPlan to a JSON object
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
      obj.region.is_a?(Vapi::SupabaseBucketPlanRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.access_key_id.is_a?(String) != false || raise("Passed value for field obj.access_key_id is not the expected type, validation failed.")
      obj.secret_access_key.is_a?(String) != false || raise("Passed value for field obj.secret_access_key is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.path&.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
    end
  end
end