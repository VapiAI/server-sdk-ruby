# frozen_string_literal: true

module Vapi
  module Types
    # This is the destination where the call ended up being transferred to. If the call was not transferred, this will
    # be empty.
    class CallDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
