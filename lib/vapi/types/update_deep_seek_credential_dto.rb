# frozen_string_literal: true

module Vapi
  module Types
    class UpdateDeepSeekCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateDeepSeekCredentialDtoProvider }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
