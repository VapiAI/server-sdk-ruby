# frozen_string_literal: true

module Vapi
  module PhoneNumbers
    module Types
      class UpdatePhoneNumbersRequestBody < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :provider

        member -> { Vapi::Types::UpdateByoPhoneNumberDto }, key: "BYO_PHONE_NUMBER"
        member -> { Vapi::Types::UpdateTwilioPhoneNumberDto }, key: "TWILIO"
        member -> { Vapi::Types::UpdateVonagePhoneNumberDto }, key: "VONAGE"
        member -> { Vapi::Types::UpdateVapiPhoneNumberDto }, key: "VAPI"
        member -> { Vapi::Types::UpdateTelnyxPhoneNumberDto }, key: "TELNYX"
      end
    end
  end
end
