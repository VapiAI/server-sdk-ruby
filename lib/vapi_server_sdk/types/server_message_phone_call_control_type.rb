# frozen_string_literal: true

module Vapi
  # This is the type of the message. "phone-call-control" is an advanced type of
  #  message.
  #  When it is requested in `assistant.serverMessages`, the hangup and forwarding
  #  responsibilities are delegated to your server. Vapi will no longer do the actual
  #  transfer and hangup.
  class ServerMessagePhoneCallControlType
    PHONE_CALL_CONTROL = "phone-call-control"
  end
end
