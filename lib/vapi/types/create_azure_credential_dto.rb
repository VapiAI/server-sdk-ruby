# frozen_string_literal: true

module Vapi
  module Types
    class CreateAzureCredentialDto < Internal::Types::Model
      field :service, -> { Vapi::Types::CreateAzureCredentialDtoService }, optional: false, nullable: false
      field :region, -> { Vapi::Types::CreateAzureCredentialDtoRegion }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :bucket_plan, -> { Vapi::Types::AzureBlobStorageBucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
