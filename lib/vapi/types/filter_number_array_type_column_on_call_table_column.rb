# frozen_string_literal: true

module Vapi
  module Types
    module FilterNumberArrayTypeColumnOnCallTableColumn
      extend Vapi::Internal::Types::Enum

      DURATION = "duration"
      COST = "cost"
      AVERAGE_MODEL_LATENCY = "averageModelLatency"
      AVERAGE_VOICE_LATENCY = "averageVoiceLatency"
      AVERAGE_TRANSCRIBER_LATENCY = "averageTranscriberLatency"
      AVERAGE_TURN_LATENCY = "averageTurnLatency"
      AVERAGE_ENDPOINTING_LATENCY = "averageEndpointingLatency"
    end
  end
end
