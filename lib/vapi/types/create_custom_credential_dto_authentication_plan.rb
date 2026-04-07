# frozen_string_literal: true

module Vapi
  module Types
    # This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
    class CreateCustomCredentialDtoAuthenticationPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::OAuth2AuthenticationPlan }, key: "OAUTH_2"
      member -> { Vapi::Types::HmacAuthenticationPlan }, key: "HMAC"
      member -> { Vapi::Types::BearerAuthenticationPlan }, key: "BEARER"
    end
  end
end
