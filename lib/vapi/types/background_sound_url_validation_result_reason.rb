# frozen_string_literal: true

module Vapi
  module Types
    module BackgroundSoundUrlValidationResultReason
      extend Vapi::Internal::Types::Enum

      INVALID_URL = "invalid-url"
      BLOCKED_ADDRESS = "blocked-address"
      UNREACHABLE = "unreachable"
      TIMEOUT = "timeout"
      TOO_MANY_REDIRECTS = "too-many-redirects"
      HTTP_ERROR = "http-error"
      NOT_AUDIO = "not-audio"
    end
  end
end
