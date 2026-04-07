# frozen_string_literal: true

module Vapi
  module Types
    # These are the messages that can be sent from client-side SDKs to control the call.
    class ClientInboundMessageMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ClientInboundMessageAddMessage }, key: "ADD_MESSAGE"
      member -> { Vapi::Types::ClientInboundMessageControl }, key: "CONTROL"
      member -> { Vapi::Types::ClientInboundMessageSay }, key: "SAY"
      member -> { Vapi::Types::ClientInboundMessageEndCall }, key: "END_CALL"
      member -> { Vapi::Types::ClientInboundMessageTransfer }, key: "TRANSFER"
      member -> { Vapi::Types::ClientInboundMessageSendTransportMessage }, key: "SEND_TRANSPORT_MESSAGE"
    end
  end
end
