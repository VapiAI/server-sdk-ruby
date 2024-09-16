# frozen_string_literal: true

module Vapi
  # This is the provider of the call.
  #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
  class CallPhoneCallProvider
    TWILIO = "twilio"
    VONAGE = "vonage"
    VAPI = "vapi"
  end
end
