# frozen_string_literal: true

module Vapi
  module Types
    # This is the transport of the call.
    class CreateOutboundCallDtoTransport < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::VapiWebsocketTransport }, key: "VAPI_WEBSOCKET"
      member -> { Vapi::Types::VonageTransport }, key: "VONAGE"
      member -> { Vapi::Types::TwilioTransport }, key: "TWILIO"
      member -> { Vapi::Types::VapiSipTransport }, key: "VAPI_SIP"
      member -> { Vapi::Types::TelnyxTransport }, key: "TELNYX"
      member -> { Vapi::Types::VapiWebCallTransport }, key: "DAILY"
    end
  end
end
