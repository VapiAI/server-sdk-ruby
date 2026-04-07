# frozen_string_literal: true

module Vapi
  module Types
    class SupabaseBucketPlan < Internal::Types::Model
      field :region, -> { Vapi::Types::SupabaseBucketPlanRegion }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :access_key_id, -> { String }, optional: false, nullable: false, api_name: "accessKeyId"
      field :secret_access_key, -> { String }, optional: false, nullable: false, api_name: "secretAccessKey"
      field :name, -> { String }, optional: false, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
