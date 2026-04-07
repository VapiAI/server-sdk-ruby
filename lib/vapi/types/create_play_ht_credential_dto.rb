# frozen_string_literal: true

module Vapi
  module Types
    class CreatePlayHtCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
