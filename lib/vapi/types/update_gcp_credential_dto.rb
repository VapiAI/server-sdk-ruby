# frozen_string_literal: true

module Vapi
  module Types
    class UpdateGcpCredentialDto < Internal::Types::Model
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :name, -> { String }, optional: true, nullable: false
      field :gcp_key, -> { Vapi::Types::GcpKey }, optional: true, nullable: false, api_name: "gcpKey"
      field :region, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::BucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
    end
  end
end
