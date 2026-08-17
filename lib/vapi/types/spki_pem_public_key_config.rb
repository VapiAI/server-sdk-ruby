# frozen_string_literal: true

module Vapi
  module Types
    # An SPKI public key in PEM format used to encrypt sensitive request data.
    class SpkiPemPublicKeyConfig < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :pem, -> { String }, optional: false, nullable: false
    end
  end
end
