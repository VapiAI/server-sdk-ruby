# frozen_string_literal: true

module Vapi
  module Types
    class SpkiPemPublicKeyConfig < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :pem, -> { String }, optional: false, nullable: false
    end
  end
end
