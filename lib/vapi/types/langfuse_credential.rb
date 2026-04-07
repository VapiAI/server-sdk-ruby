# frozen_string_literal: true

module Vapi
  module Types
    class LangfuseCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::LangfuseCredentialProvider }, optional: false, nullable: false
      field :public_key, -> { String }, optional: false, nullable: false, api_name: "publicKey"
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :api_url, -> { String }, optional: false, nullable: false, api_name: "apiUrl"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
