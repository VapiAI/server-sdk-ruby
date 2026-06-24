# frozen_string_literal: true

module Vapi
  module Types
    module CartesiaSpeedControlZero
      extend Vapi::Internal::Types::Enum

      SLOWEST = "slowest"
      SLOW = "slow"
      NORMAL = "normal"
      FAST = "fast"
      FASTEST = "fastest"
    end
  end
end
