# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CreateS3CredentialDto
  # @return [String] AWS access key ID.
    attr_reader :aws_access_key_id
  # @return [String] AWS access key secret. This is not returned in the API.
    attr_reader :aws_secret_access_key
  # @return [String] AWS region in which the S3 bucket is located.
    attr_reader :region
  # @return [String] AWS S3 bucket name.
    attr_reader :s_3_bucket_name
  # @return [String] The path prefix for the uploaded recording. Ex. "recordings/"
    attr_reader :s_3_path_prefix
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param aws_access_key_id [String] AWS access key ID.
    # @param aws_secret_access_key [String] AWS access key secret. This is not returned in the API.
    # @param region [String] AWS region in which the S3 bucket is located.
    # @param s_3_bucket_name [String] AWS S3 bucket name.
    # @param s_3_path_prefix [String] The path prefix for the uploaded recording. Ex. "recordings/"
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateS3CredentialDto]
    def initialize(aws_access_key_id:, aws_secret_access_key:, region:, s_3_bucket_name:, s_3_path_prefix:, name: OMIT, additional_properties: nil)
      @aws_access_key_id = aws_access_key_id
      @aws_secret_access_key = aws_secret_access_key
      @region = region
      @s_3_bucket_name = s_3_bucket_name
      @s_3_path_prefix = s_3_path_prefix
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "awsAccessKeyId": aws_access_key_id, "awsSecretAccessKey": aws_secret_access_key, "region": region, "s3BucketName": s_3_bucket_name, "s3PathPrefix": s_3_path_prefix, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateS3CredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateS3CredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      aws_access_key_id = parsed_json["awsAccessKeyId"]
      aws_secret_access_key = parsed_json["awsSecretAccessKey"]
      region = parsed_json["region"]
      s_3_bucket_name = parsed_json["s3BucketName"]
      s_3_path_prefix = parsed_json["s3PathPrefix"]
      name = parsed_json["name"]
      new(
        aws_access_key_id: aws_access_key_id,
        aws_secret_access_key: aws_secret_access_key,
        region: region,
        s_3_bucket_name: s_3_bucket_name,
        s_3_path_prefix: s_3_path_prefix,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateS3CredentialDto to a JSON object
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
      obj.aws_access_key_id.is_a?(String) != false || raise("Passed value for field obj.aws_access_key_id is not the expected type, validation failed.")
      obj.aws_secret_access_key.is_a?(String) != false || raise("Passed value for field obj.aws_secret_access_key is not the expected type, validation failed.")
      obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.s_3_bucket_name.is_a?(String) != false || raise("Passed value for field obj.s_3_bucket_name is not the expected type, validation failed.")
      obj.s_3_path_prefix.is_a?(String) != false || raise("Passed value for field obj.s_3_path_prefix is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end