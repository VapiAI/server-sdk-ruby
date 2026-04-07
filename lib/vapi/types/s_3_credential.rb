# frozen_string_literal: true

module Vapi
  module Types
    class S3Credential < Internal::Types::Model
      field :provider, -> { Vapi::Types::S3CredentialProvider }, optional: false, nullable: false
      field :aws_access_key_id, -> { String }, optional: false, nullable: false, api_name: "awsAccessKeyId"
      field :aws_secret_access_key, -> { String }, optional: false, nullable: false, api_name: "awsSecretAccessKey"
      field :region, -> { String }, optional: false, nullable: false
      field :s_3_bucket_name, -> { String }, optional: false, nullable: false, api_name: "s3BucketName"
      field :s_3_path_prefix, -> { String }, optional: false, nullable: false, api_name: "s3PathPrefix"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
