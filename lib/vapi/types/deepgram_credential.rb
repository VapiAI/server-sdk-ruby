# frozen_string_literal: true

module Vapi
  module Types
    class DeepgramCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::DeepgramCredentialProvider }, optional: false, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :api_url, -> { String }, optional: true, nullable: false, api_name: "apiUrl"
    end
  end
end
