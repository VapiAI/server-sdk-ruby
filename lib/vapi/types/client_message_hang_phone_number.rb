# frozen_string_literal: true

module Vapi
  module Types
    # This is the phone number that the message is associated with.
    class ClientMessageHangPhoneNumber < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::CreateByoPhoneNumberDto }, key: "BYO_PHONE_NUMBER"
      member -> { Vapi::Types::CreateTwilioPhoneNumberDto }, key: "TWILIO"
      member -> { Vapi::Types::CreateVonagePhoneNumberDto }, key: "VONAGE"
      member -> { Vapi::Types::CreateVapiPhoneNumberDto }, key: "VAPI"
      member -> { Vapi::Types::CreateTelnyxPhoneNumberDto }, key: "TELNYX"
    end
  end
end
