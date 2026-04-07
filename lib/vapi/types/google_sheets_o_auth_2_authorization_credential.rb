# frozen_string_literal: true

module Vapi
  module Types
    class GoogleSheetsOAuth2AuthorizationCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::GoogleSheetsOAuth2AuthorizationCredentialProvider }, optional: false, nullable: false
      field :authorization_id, -> { String }, optional: false, nullable: false, api_name: "authorizationId"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
