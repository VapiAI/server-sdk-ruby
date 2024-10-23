# frozen_string_literal: true

module Vapi
  # This is the protocol to use for SIP signaling outbound calls. Default is udp.
  #  @default udp
  class SipTrunkGatewayOutboundProtocol
    TLS_SRTP = "tls/srtp"
    TCP = "tcp"
    TLS = "tls"
    UDP = "udp"
  end
end
