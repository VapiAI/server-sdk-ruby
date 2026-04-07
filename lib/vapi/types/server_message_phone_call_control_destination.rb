# frozen_string_literal: true

module Vapi
  module Types
    # This is the destination to forward the call to if the request is "forward".
    class ServerMessagePhoneCallControlDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
