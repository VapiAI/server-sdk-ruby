# frozen_string_literal: true

module Vapi
  module Types
    class CreateVonageCredentialDto < Internal::Types::Model
      field :api_secret, -> { String }, optional: false, nullable: false, api_name: "apiSecret"
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
