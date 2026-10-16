# frozen_string_literal: true

module Vapi
  module Types
    # OAuth 2.0 client credential for Google Calendar integrations.
    class CreateGoogleCalendarOAuth2ClientCredentialDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
