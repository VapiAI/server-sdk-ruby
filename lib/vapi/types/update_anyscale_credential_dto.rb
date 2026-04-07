# frozen_string_literal: true

module Vapi
  module Types
    class UpdateAnyscaleCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
