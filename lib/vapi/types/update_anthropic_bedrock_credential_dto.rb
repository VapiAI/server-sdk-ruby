# frozen_string_literal: true

module Vapi
  module Types
    class UpdateAnthropicBedrockCredentialDto < Internal::Types::Model
      field :region, -> { Vapi::Types::UpdateAnthropicBedrockCredentialDtoRegion }, optional: true, nullable: false
      field :authentication_plan, -> { Vapi::Types::UpdateAnthropicBedrockCredentialDtoAuthenticationPlan }, optional: true, nullable: false, api_name: "authenticationPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
