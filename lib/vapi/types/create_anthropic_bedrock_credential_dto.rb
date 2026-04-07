# frozen_string_literal: true

module Vapi
  module Types
    class CreateAnthropicBedrockCredentialDto < Internal::Types::Model
      field :region, -> { Vapi::Types::CreateAnthropicBedrockCredentialDtoRegion }, optional: false, nullable: false
      field :authentication_plan, -> { Vapi::Types::CreateAnthropicBedrockCredentialDtoAuthenticationPlan }, optional: false, nullable: false, api_name: "authenticationPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
