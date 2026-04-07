# frozen_string_literal: true

module Vapi
  module Types
    # This is the destination to transfer the inbound call to. This will immediately transfer without using any
    # assistants.
    #
    # If this is sent, `assistantId`, `assistant`, `squadId`, and `squad` are ignored.
    class ServerMessageResponseAssistantRequestDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
