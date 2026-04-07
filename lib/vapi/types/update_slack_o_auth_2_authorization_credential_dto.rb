# frozen_string_literal: true

module Vapi
  module Types
    class UpdateSlackOAuth2AuthorizationCredentialDto < Internal::Types::Model
      field :authorization_id, -> { String }, optional: true, nullable: false, api_name: "authorizationId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
