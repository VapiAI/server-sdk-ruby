# frozen_string_literal: true

module Vapi
  module Types
    class AzureBlobStorageBucketPlan < Internal::Types::Model
      field :connection_string, -> { String }, optional: false, nullable: false, api_name: "connectionString"
      field :container_name, -> { String }, optional: false, nullable: false, api_name: "containerName"
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
