# frozen_string_literal: true

module Vapi
  module Types
    module ClientInboundMessageControlControl
      extend Vapi::Internal::Types::Enum

      MUTE_ASSISTANT = "mute-assistant"
      UNMUTE_ASSISTANT = "unmute-assistant"
      MUTE_CUSTOMER = "mute-customer"
      UNMUTE_CUSTOMER = "unmute-customer"
      SAY_FIRST_MESSAGE = "say-first-message"
    end
  end
end
