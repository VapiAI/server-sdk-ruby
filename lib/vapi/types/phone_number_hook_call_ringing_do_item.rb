# frozen_string_literal: true

module Vapi
  module Types
    class PhoneNumberHookCallRingingDoItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferPhoneNumberHookAction }, key: "TRANSFER"
      member -> { Vapi::Types::SayPhoneNumberHookAction }, key: "SAY"
    end
  end
end
