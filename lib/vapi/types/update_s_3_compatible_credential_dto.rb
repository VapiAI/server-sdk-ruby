# frozen_string_literal: true

module Vapi
  module Types
    class UpdateS3CompatibleCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateS3CompatibleCredentialDtoProvider }, optional: true, nullable: false
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :bucket_plan, -> { Vapi::Types::UpdateS3CompatibleBucketPlanDto }, optional: true, nullable: false, api_name: "bucketPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
