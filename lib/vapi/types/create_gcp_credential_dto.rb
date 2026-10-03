# frozen_string_literal: true

module Vapi
  module Types
    # Service-account credentials for Google Cloud resources and optional call-artifact storage, including region,
    # bucket configuration, and upload fallback order.
    class CreateGcpCredentialDto < Internal::Types::Model
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :gcp_key, -> { Vapi::Types::GcpKey }, optional: false, nullable: false, api_name: "gcpKey"
      field :region, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::BucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
