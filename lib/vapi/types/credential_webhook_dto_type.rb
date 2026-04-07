# frozen_string_literal: true

module Vapi
  module Types
    module CredentialWebhookDtoType
      extend Vapi::Internal::Types::Enum

      AUTH = "auth"
      SYNC = "sync"
      FORWARD = "forward"
    end
  end
end
