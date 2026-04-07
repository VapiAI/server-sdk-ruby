# frozen_string_literal: true

module Vapi
  module Types
    # The public key configuration.
    class PublicKeyEncryptionPlanPublicKey < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :format

      member -> { Vapi::Types::SpkiPemPublicKeyConfig }, key: "SPKI_PEM"
    end
  end
end
