# frozen_string_literal: true

module Vapi
  module Types
    class SupabaseCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::SupabaseCredentialProvider }, optional: false, nullable: false
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::SupabaseBucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
    end
  end
end
