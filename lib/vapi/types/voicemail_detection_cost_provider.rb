# frozen_string_literal: true

module Vapi
  module Types
    module VoicemailDetectionCostProvider
      extend Vapi::Internal::Types::Enum

      TWILIO = "twilio"
      GOOGLE = "google"
      OPENAI = "openai"
      VAPI = "vapi"
    end
  end
end
