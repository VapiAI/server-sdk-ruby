# frozen_string_literal: true

module Vapi
  module Types
    class UpdateMicrosoftCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateMicrosoftCredentialDtoProvider }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :region, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
