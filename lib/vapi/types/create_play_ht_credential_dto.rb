# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating voice synthesis requests with PlayHT, including the PlayHT user identifier.
    class CreatePlayHtCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
