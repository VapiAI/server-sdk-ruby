# frozen_string_literal: true

module Vapi
  module Types
    class CloudflareCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::CloudflareCredentialProvider }, optional: false, nullable: false
      field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :account_email, -> { String }, optional: true, nullable: false, api_name: "accountEmail"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::CloudflareR2BucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
    end
  end
end
