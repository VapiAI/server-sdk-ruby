# frozen_string_literal: true

module Vapi
  module Types
    class CreateVonagePhoneNumberDtoHooksItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :on

      member -> { Vapi::Types::PhoneNumberHookCallRinging }, key: "CALL_RINGING"
      member -> { Vapi::Types::PhoneNumberHookCallEnding }, key: "CALL_ENDING"
    end
  end
end
