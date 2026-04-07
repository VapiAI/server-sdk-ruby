# frozen_string_literal: true

module Vapi
  module Types
    class CredentialSessionError < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
    end
  end
end
