# frozen_string_literal: true

module Vapi
  # This is the transport of the phone call.
  #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
  class CallPhoneCallTransport
    SIP = "sip"
    PSTN = "pstn"
  end
end
