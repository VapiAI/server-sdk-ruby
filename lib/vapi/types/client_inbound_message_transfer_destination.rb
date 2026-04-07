# frozen_string_literal: true

module Vapi
  module Types
    # This is the destination to transfer the call to.
    class ClientInboundMessageTransferDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
