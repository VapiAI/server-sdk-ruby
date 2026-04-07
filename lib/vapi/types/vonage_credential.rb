# frozen_string_literal: true

module Vapi
  module Types
    class VonageCredential < Internal::Types::Model
      field :vonage_application_private_key, -> { String }, optional: false, nullable: false, api_name: "vonageApplicationPrivateKey"
      field :provider, -> { Vapi::Types::VonageCredentialProvider }, optional: false, nullable: false
      field :api_secret, -> { String }, optional: false, nullable: false, api_name: "apiSecret"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :vonage_application_id, -> { String }, optional: false, nullable: false, api_name: "vonageApplicationId"
      field :name, -> { String }, optional: true, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
    end
  end
end
