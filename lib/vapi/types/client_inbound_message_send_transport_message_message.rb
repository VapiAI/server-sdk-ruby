# frozen_string_literal: true

module Vapi
  module Types
    # This is the transport-specific message to send.
    class ClientInboundMessageSendTransportMessageMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :transport

      member -> { Vapi::Types::VapiSipTransportMessage }, key: "VAPI_SIP"
      member -> { Vapi::Types::TwilioTransportMessage }, key: "TWILIO"
    end
  end
end
