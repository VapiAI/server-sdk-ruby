# frozen_string_literal: true

module Vapi
  module Types
    class CustomLlmCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::CustomLlmCredentialProvider }, optional: false, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :authentication_plan, -> { Vapi::Types::OAuth2AuthenticationPlan }, optional: true, nullable: false, api_name: "authenticationPlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :authentication_session, -> { Vapi::Types::Oauth2AuthenticationSession }, optional: true, nullable: false, api_name: "authenticationSession"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
