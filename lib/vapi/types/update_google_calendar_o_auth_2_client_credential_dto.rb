# frozen_string_literal: true

module Vapi
  module Types
    class UpdateGoogleCalendarOAuth2ClientCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateGoogleCalendarOAuth2ClientCredentialDtoProvider }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
