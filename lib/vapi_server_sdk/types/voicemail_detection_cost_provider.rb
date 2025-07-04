# frozen_string_literal: true

module Vapi
  # This is the provider that was used to detect the voicemail.
  class VoicemailDetectionCostProvider
    TWILIO = "twilio"
    GOOGLE = "google"
    OPENAI = "openai"
    VAPI = "vapi"
  end
end
