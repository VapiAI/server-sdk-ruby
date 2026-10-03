# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating requests to a custom language model with an API key or OAuth 2.0 authentication
    # plan.
    class CreateCustomLlmCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :authentication_plan, -> { Vapi::Types::OAuth2AuthenticationPlan }, optional: true, nullable: false, api_name: "authenticationPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
