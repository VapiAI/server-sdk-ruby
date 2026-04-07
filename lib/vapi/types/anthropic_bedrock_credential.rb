# frozen_string_literal: true

module Vapi
  module Types
    class AnthropicBedrockCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::AnthropicBedrockCredentialProvider }, optional: false, nullable: false
      field :region, -> { Vapi::Types::AnthropicBedrockCredentialRegion }, optional: false, nullable: false
      field :authentication_plan, -> { Vapi::Types::AnthropicBedrockCredentialAuthenticationPlan }, optional: false, nullable: false, api_name: "authenticationPlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :authentication_artifact, -> { Vapi::Types::AwsStsAuthenticationArtifact }, optional: true, nullable: false, api_name: "authenticationArtifact"
      field :authentication_session, -> { Vapi::Types::AwsStsAuthenticationSession }, optional: true, nullable: false, api_name: "authenticationSession"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
