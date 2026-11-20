# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating assistant model requests with Anthropic.
    class CreateAnthropicCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
