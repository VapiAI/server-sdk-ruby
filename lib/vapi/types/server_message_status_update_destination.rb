# frozen_string_literal: true

module Vapi
  module Types
    # This is the destination the call is being transferred to. This is only sent if the status is "forwarding".
    class ServerMessageStatusUpdateDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
