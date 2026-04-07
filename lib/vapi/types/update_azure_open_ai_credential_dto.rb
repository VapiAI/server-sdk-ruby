# frozen_string_literal: true

module Vapi
  module Types
    class UpdateAzureOpenAiCredentialDto < Internal::Types::Model
      field :region, -> { Vapi::Types::UpdateAzureOpenAiCredentialDtoRegion }, optional: true, nullable: false
      field :models, -> { Internal::Types::Array[Vapi::Types::UpdateAzureOpenAiCredentialDtoModelsItem] }, optional: true, nullable: false
      field :open_ai_key, -> { String }, optional: true, nullable: false, api_name: "openAIKey"
      field :ocp_apim_subscription_key, -> { String }, optional: true, nullable: false, api_name: "ocpApimSubscriptionKey"
      field :name, -> { String }, optional: true, nullable: false
      field :open_ai_endpoint, -> { String }, optional: true, nullable: false, api_name: "openAIEndpoint"
    end
  end
end
