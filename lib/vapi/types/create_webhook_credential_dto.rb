# frozen_string_literal: true

module Vapi
  module Types
    class CreateWebhookCredentialDto < Internal::Types::Model
      field :authentication_plan, -> { Vapi::Types::CreateWebhookCredentialDtoAuthenticationPlan }, optional: false, nullable: false, api_name: "authenticationPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
