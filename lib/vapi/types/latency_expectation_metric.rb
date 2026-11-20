# frozen_string_literal: true

module Vapi
  module Types
    module LatencyExpectationMetric
      extend Vapi::Internal::Types::Enum

      TURN = "turn"
      MODEL = "model"
      VOICE = "voice"
      TRANSCRIBER = "transcriber"
      ENDPOINTING = "endpointing"
    end
  end
end
