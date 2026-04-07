# frozen_string_literal: true

module Vapi
  module Types
    class UpdateCustomLlmCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :authentication_plan, -> { Vapi::Types::OAuth2AuthenticationPlan }, optional: true, nullable: false, api_name: "authenticationPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
