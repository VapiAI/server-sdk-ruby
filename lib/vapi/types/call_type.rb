# frozen_string_literal: true

module Vapi
  module Types
    module CallType
      extend Vapi::Internal::Types::Enum

      INBOUND_PHONE_CALL = "inboundPhoneCall"
      OUTBOUND_PHONE_CALL = "outboundPhoneCall"
      WEB_CALL = "webCall"
      VAPI_WEBSOCKET_CALL = "vapi.websocketCall"
    end
  end
end
