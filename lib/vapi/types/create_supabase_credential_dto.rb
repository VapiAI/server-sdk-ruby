# frozen_string_literal: true

module Vapi
  module Types
    class CreateSupabaseCredentialDto < Internal::Types::Model
      field :fallback_index, -> { Integer }, optional: true, nullable: false, api_name: "fallbackIndex"
      field :bucket_plan, -> { Vapi::Types::SupabaseBucketPlan }, optional: true, nullable: false, api_name: "bucketPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
