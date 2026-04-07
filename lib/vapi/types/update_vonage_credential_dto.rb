# frozen_string_literal: true

module Vapi
  module Types
    class UpdateVonageCredentialDto < Internal::Types::Model
      field :api_secret, -> { String }, optional: true, nullable: false, api_name: "apiSecret"
      field :name, -> { String }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
    end
  end
end
