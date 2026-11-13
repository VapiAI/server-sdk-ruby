# frozen_string_literal: true

module Vapi
  module Types
    # A phone-number hook action that transfers the call to a phone number or SIP destination.
    class TransferPhoneNumberHookAction < Internal::Types::Model
      field :destination, -> { Vapi::Types::TransferPhoneNumberHookActionDestination }, optional: true, nullable: false
    end
  end
end
