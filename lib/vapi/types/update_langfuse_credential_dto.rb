# frozen_string_literal: true

module Vapi
  module Types
    class UpdateLangfuseCredentialDto < Internal::Types::Model
      field :public_key, -> { String }, optional: true, nullable: false, api_name: "publicKey"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :api_url, -> { String }, optional: true, nullable: false, api_name: "apiUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
