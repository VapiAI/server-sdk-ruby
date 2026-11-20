# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating assistant model requests with Azure OpenAI, including region, endpoint, and
    # available models.
    class CreateAzureOpenAiCredentialDto < Internal::Types::Model
      field :region, -> { Vapi::Types::CreateAzureOpenAiCredentialDtoRegion }, optional: false, nullable: false
      field :models, -> { Internal::Types::Array[Vapi::Types::CreateAzureOpenAiCredentialDtoModelsItem] }, optional: false, nullable: false
      field :open_ai_key, -> { String }, optional: false, nullable: false, api_name: "openAIKey"
      field :ocp_apim_subscription_key, -> { String }, optional: true, nullable: false, api_name: "ocpApimSubscriptionKey"
      field :open_ai_endpoint, -> { String }, optional: false, nullable: false, api_name: "openAIEndpoint"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
