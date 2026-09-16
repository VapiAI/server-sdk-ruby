# frozen_string_literal: true

module Vapi
  module Types
    class CreateMicrosoftCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :region, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
