# frozen_string_literal: true

module Vapi
  module Types
    # Stored OAuth 2.0 authorization for Google Calendar operations.
    class CreateGoogleCalendarOAuth2AuthorizationCredentialDto < Internal::Types::Model
      field :authorization_id, -> { String }, optional: false, nullable: false, api_name: "authorizationId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
