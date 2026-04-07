# frozen_string_literal: true

module Vapi
  module Types
    class CreateCloudflareCredentialDto < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :account_email, -> { String }, optional: true, nullable: false, api_name: "accountEmail"
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :bucket_plan, -> { Vapi::Types::CloudflareR2BucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
