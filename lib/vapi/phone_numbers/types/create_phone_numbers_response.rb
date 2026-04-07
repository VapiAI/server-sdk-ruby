# frozen_string_literal: true

module Vapi
  module PhoneNumbers
    module Types
      class CreatePhoneNumbersResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :provider

        member -> { Vapi::Types::ByoPhoneNumber }, key: "BYO_PHONE_NUMBER"
        member -> { Vapi::Types::TwilioPhoneNumber }, key: "TWILIO"
        member -> { Vapi::Types::VonagePhoneNumber }, key: "VONAGE"
        member -> { Vapi::Types::VapiPhoneNumber }, key: "VAPI"
        member -> { Vapi::Types::TelnyxPhoneNumber }, key: "TELNYX"
      end
    end
  end
end
