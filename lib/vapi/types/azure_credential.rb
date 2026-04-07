# frozen_string_literal: true

module Vapi
  module Types
    class AzureCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::AzureCredentialProvider }, optional: false, nullable: false
      field :service, -> { Vapi::Types::AzureCredentialService }, optional: false, nullable: false
      field :region, -> { Vapi::Types::AzureCredentialRegion }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::AzureBlobStorageBucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
    end
  end
end
