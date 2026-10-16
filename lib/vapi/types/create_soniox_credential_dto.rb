# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating transcription requests with Soniox.
    class CreateSonioxCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :api_url, -> { String }, optional: true, nullable: false, api_name: "apiUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
