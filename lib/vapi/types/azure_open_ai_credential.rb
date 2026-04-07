# frozen_string_literal: true

module Vapi
  module Types
    class AzureOpenAiCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::AzureOpenAiCredentialProvider }, optional: false, nullable: false
      field :region, -> { Vapi::Types::AzureOpenAiCredentialRegion }, optional: false, nullable: false
      field :models, -> { Internal::Types::Array[Vapi::Types::AzureOpenAiCredentialModelsItem] }, optional: false, nullable: false
      field :open_ai_key, -> { String }, optional: false, nullable: false, api_name: "openAIKey"
      field :ocp_apim_subscription_key, -> { String }, optional: true, nullable: false, api_name: "ocpApimSubscriptionKey"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :open_ai_endpoint, -> { String }, optional: false, nullable: false, api_name: "openAIEndpoint"
    end
  end
end
