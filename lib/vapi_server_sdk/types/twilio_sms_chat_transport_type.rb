# frozen_string_literal: true

module Vapi
  # The type of transport to use for sending the chat response.
  #  Currently supports 'twilio.sms' for SMS delivery via Twilio.
  class TwilioSmsChatTransportType
    TWILIO_SMS = "twilio.sms"
  end
end
