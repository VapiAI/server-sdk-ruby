# frozen_string_literal: true

module Vapi
  module Types
    class CloudflareR2BucketPlan < Internal::Types::Model
      field :access_key_id, -> { String }, optional: true, nullable: false, api_name: "accessKeyId"
      field :secret_access_key, -> { String }, optional: true, nullable: false, api_name: "secretAccessKey"
      field :url, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
