# frozen_string_literal: true

module Vapi
  module Types
    module CredentialWebhookDtoAuthMode
      extend Vapi::Internal::Types::Enum

      OAUTH_2 = "OAUTH2"
      API_KEY = "API_KEY"
      BASIC = "BASIC"
    end
  end
end
