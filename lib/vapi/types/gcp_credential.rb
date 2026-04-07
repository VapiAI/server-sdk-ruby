# frozen_string_literal: true

module Vapi
  module Types
    class GcpCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::GcpCredentialProvider }, optional: false, nullable: false
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :gcp_key, -> { Vapi::Types::GcpKey }, optional: false, nullable: false, api_name: "gcpKey"
      field :region, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::BucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
    end
  end
end
