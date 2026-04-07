# frozen_string_literal: true

module Vapi
  module Types
    class CreateCustomCredentialDto < Internal::Types::Model
      field :authentication_plan, -> { Vapi::Types::CreateCustomCredentialDtoAuthenticationPlan }, optional: false, nullable: false, api_name: "authenticationPlan"
      field :encryption_plan, -> { Vapi::Types::CreateCustomCredentialDtoEncryptionPlan }, optional: true, nullable: false, api_name: "encryptionPlan"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
