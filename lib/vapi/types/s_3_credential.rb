# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class S3Credential
    # @return [String] Credential provider. Only allowed value is s3
    attr_reader :provider
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
    # @return [String] This is the unique identifier for the credential.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this credential belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] Credential provider. Only allowed value is s3
    # @param aws_access_key_id [String] AWS access key ID.
    # @param aws_secret_access_key [String] AWS access key secret. This is not returned in the API.
    # @param region [String] AWS region in which the S3 bucket is located.
    # @param s_3_bucket_name [String] AWS S3 bucket name.
    # @param s_3_path_prefix [String] The path prefix for the uploaded recording. Ex. "recordings/"
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::S3Credential]
    def initialize(provider:, aws_access_key_id:, aws_secret_access_key:, region:, s_3_bucket_name:, s_3_path_prefix:,
                   id:, org_id:, created_at:, updated_at:, additional_properties: nil)
      @provider = provider
      @aws_access_key_id = aws_access_key_id
      @aws_secret_access_key = aws_secret_access_key
      @region = region
      @s_3_bucket_name = s_3_bucket_name
      @s_3_path_prefix = s_3_path_prefix
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "awsAccessKeyId": aws_access_key_id,
        "awsSecretAccessKey": aws_secret_access_key,
        "region": region,
        "s3BucketName": s_3_bucket_name,
        "s3PathPrefix": s_3_path_prefix,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }
    end

    # Deserialize a JSON object to an instance of S3Credential
    #
    # @param json_object [String]
    # @return [Vapi::S3Credential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      aws_access_key_id = parsed_json["awsAccessKeyId"]
      aws_secret_access_key = parsed_json["awsSecretAccessKey"]
      region = parsed_json["region"]
      s_3_bucket_name = parsed_json["s3BucketName"]
      s_3_path_prefix = parsed_json["s3PathPrefix"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        provider: provider,
        aws_access_key_id: aws_access_key_id,
        aws_secret_access_key: aws_secret_access_key,
        region: region,
        s_3_bucket_name: s_3_bucket_name,
        s_3_path_prefix: s_3_path_prefix,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of S3Credential to a JSON object
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
      obj.aws_access_key_id.is_a?(String) != false || raise("Passed value for field obj.aws_access_key_id is not the expected type, validation failed.")
      obj.aws_secret_access_key.is_a?(String) != false || raise("Passed value for field obj.aws_secret_access_key is not the expected type, validation failed.")
      obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.s_3_bucket_name.is_a?(String) != false || raise("Passed value for field obj.s_3_bucket_name is not the expected type, validation failed.")
      obj.s_3_path_prefix.is_a?(String) != false || raise("Passed value for field obj.s_3_path_prefix is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
