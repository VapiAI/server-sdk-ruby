# frozen_string_literal: true

module Vapi
  module Types
    class UpdateS3CredentialDto < Internal::Types::Model
      field :aws_access_key_id, -> { String }, optional: true, nullable: false, api_name: "awsAccessKeyId"
      field :aws_secret_access_key, -> { String }, optional: true, nullable: false, api_name: "awsSecretAccessKey"
      field :region, -> { String }, optional: true, nullable: false
      field :s_3_bucket_name, -> { String }, optional: true, nullable: false, api_name: "s3BucketName"
      field :s_3_path_prefix, -> { String }, optional: true, nullable: false, api_name: "s3PathPrefix"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
