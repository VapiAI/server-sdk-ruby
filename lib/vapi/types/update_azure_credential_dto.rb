# frozen_string_literal: true

module Vapi
  module Types
    class UpdateAzureCredentialDto < Internal::Types::Model
      field :service, -> { Vapi::Types::UpdateAzureCredentialDtoService }, optional: true, nullable: false
      field :region, -> { Vapi::Types::UpdateAzureCredentialDtoRegion }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :name, -> { String }, optional: true, nullable: false
      field :bucket_plan, -> { Vapi::Types::AzureBlobStorageBucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
    end
  end
end
