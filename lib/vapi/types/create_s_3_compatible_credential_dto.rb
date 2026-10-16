# frozen_string_literal: true

module Vapi
  module Types
    class CreateS3CompatibleCredentialDto < Internal::Types::Model
      field :bucket_plan, -> { Vapi::Types::S3CompatibleBucketPlan }, optional: false, nullable: false, api_name: "bucketPlan"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
