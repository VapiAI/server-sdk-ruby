# frozen_string_literal: true

module Vapi
  module Types
    class S3CompatibleStorageCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::S3CompatibleStorageCredentialProvider }, optional: false, nullable: false
      field :bucket_plan, -> { Vapi::Types::S3CompatibleBucketPlan }, optional: false, nullable: false, api_name: "bucketPlan"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
