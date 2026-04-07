# frozen_string_literal: true

module Vapi
  module Types
    class Oauth2AuthenticationSession < Internal::Types::Model
      field :access_token, -> { String }, optional: true, nullable: false, api_name: "accessToken"
      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
      field :refresh_token, -> { String }, optional: true, nullable: false, api_name: "refreshToken"
    end
  end
end
