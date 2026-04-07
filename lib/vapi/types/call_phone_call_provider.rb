# frozen_string_literal: true

module Vapi
  module Types
    module CallPhoneCallProvider
      extend Vapi::Internal::Types::Enum

      TWILIO = "twilio"
      VONAGE = "vonage"
      VAPI = "vapi"
      TELNYX = "telnyx"
    end
  end
end
