# frozen_string_literal: true

module Vapi
  module Types
    class WebhookCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::WebhookCredentialProvider }, optional: false, nullable: false
      field :authentication_plan, -> { Vapi::Types::WebhookCredentialAuthenticationPlan }, optional: false, nullable: false, api_name: "authenticationPlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :authentication_session, -> { Vapi::Types::Oauth2AuthenticationSession }, optional: false, nullable: false, api_name: "authenticationSession"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
