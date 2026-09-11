# frozen_string_literal: true

module Vapi
  module Types
    class UpdateGoogleSheetsOAuth2AuthorizationCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateGoogleSheetsOAuth2AuthorizationCredentialDtoProvider }, optional: true, nullable: false
      field :authorization_id, -> { String }, optional: true, nullable: false, api_name: "authorizationId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
