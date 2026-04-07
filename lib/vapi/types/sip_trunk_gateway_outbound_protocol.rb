# frozen_string_literal: true

module Vapi
  module Types
    module SipTrunkGatewayOutboundProtocol
      extend Vapi::Internal::Types::Enum

      TLS_SRTP = "tls/srtp"
      TCP = "tcp"
      TLS = "tls"
      UDP = "udp"
    end
  end
end
