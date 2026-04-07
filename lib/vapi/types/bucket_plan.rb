# frozen_string_literal: true

module Vapi
  module Types
    class BucketPlan < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :region, -> { String }, optional: true, nullable: false
      field :path, -> { String }, optional: true, nullable: false
      field :hmac_access_key, -> { String }, optional: true, nullable: false, api_name: "hmacAccessKey"
      field :hmac_secret, -> { String }, optional: true, nullable: false, api_name: "hmacSecret"
    end
  end
end
