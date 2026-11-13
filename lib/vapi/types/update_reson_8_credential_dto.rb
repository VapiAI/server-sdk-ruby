# frozen_string_literal: true

module Vapi
  module Types
    class UpdateReson8CredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateReson8CredentialDtoProvider }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
