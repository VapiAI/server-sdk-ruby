# frozen_string_literal: true

module Vapi
  module Types
    # OAuth 2.0 session tokens and expiration used to authenticate integration requests.
    class Oauth2AuthenticationSession < Internal::Types::Model
      field :access_token, -> { String }, optional: true, nullable: false, api_name: "accessToken"
      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
      field :refresh_token, -> { String }, optional: true, nullable: false, api_name: "refreshToken"
    end
  end
end
