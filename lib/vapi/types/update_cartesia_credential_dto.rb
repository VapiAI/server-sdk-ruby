# frozen_string_literal: true

module Vapi
  module Types
    class UpdateCartesiaCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateCartesiaCredentialDtoProvider }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
      field :api_url, -> { String }, optional: true, nullable: false, api_name: "apiUrl"
    end
  end
end
