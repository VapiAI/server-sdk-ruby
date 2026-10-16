# frozen_string_literal: true

module Vapi
  module Types
    # Reusable custom credentials for authenticating outbound requests, with optional public-key encryption for
    # sensitive request data.
    class CreateCustomCredentialDto < Internal::Types::Model
      field :authentication_plan, -> { Vapi::Types::CreateCustomCredentialDtoAuthenticationPlan }, optional: false, nullable: false, api_name: "authenticationPlan"
      field :encryption_plan, -> { Vapi::Types::CreateCustomCredentialDtoEncryptionPlan }, optional: true, nullable: false, api_name: "encryptionPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
