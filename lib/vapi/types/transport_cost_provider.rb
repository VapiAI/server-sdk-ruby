# frozen_string_literal: true

module Vapi
  module Types
    module TransportCostProvider
      extend Vapi::Internal::Types::Enum

      DAILY = "daily"
      VAPI_WEBSOCKET = "vapi.websocket"
      TWILIO = "twilio"
      VONAGE = "vonage"
      TELNYX = "telnyx"
      VAPI_SIP = "vapi.sip"
    end
  end
end
