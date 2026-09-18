# frozen_string_literal: true

module Vapi
  module Types
    class UpdateS3CompatibleBucketPlanDto < Internal::Types::Model
      field :url, -> { String }, optional: true, nullable: false
      field :region, -> { String }, optional: true, nullable: false
      field :access_key_id, -> { String }, optional: true, nullable: false, api_name: "accessKeyId"
      field :secret_access_key, -> { String }, optional: true, nullable: false, api_name: "secretAccessKey"
      field :name, -> { String }, optional: true, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
