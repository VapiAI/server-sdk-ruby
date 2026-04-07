# frozen_string_literal: true

module Vapi
  module Types
    # This is the encryption plan for encrypting sensitive data. Currently supports public-key encryption.
    class CreateCustomCredentialDtoEncryptionPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::PublicKeyEncryptionPlan }, key: "PUBLIC_KEY"
    end
  end
end
