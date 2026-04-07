# frozen_string_literal: true

module Vapi
  module Types
    class UpdateWebhookCredentialDto < Internal::Types::Model
      field :authentication_plan, -> { Vapi::Types::UpdateWebhookCredentialDtoAuthenticationPlan }, optional: true, nullable: false, api_name: "authenticationPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
