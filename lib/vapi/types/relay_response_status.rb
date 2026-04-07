# frozen_string_literal: true

module Vapi
  module Types
    module RelayResponseStatus
      extend Vapi::Internal::Types::Enum

      DELIVERED_LIVE = "deliveredLive"
      DELIVERED_HEADLESS = "deliveredHeadless"
      FAILED = "failed"
    end
  end
end
