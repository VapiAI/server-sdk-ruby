# frozen_string_literal: true

module Vapi
  module Types
    class UpdateElevenLabsCredentialDto < Internal::Types::Model
      field :provider, -> { String }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :api_url, -> { Vapi::Types::UpdateElevenLabsCredentialDtoApiUrl }, optional: true, nullable: false, api_name: "apiUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
