# frozen_string_literal: true

module Vapi
  module Types
    class UpdatePlayHtCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdatePlayHtCredentialDtoProvider }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
      field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"
    end
  end
end
