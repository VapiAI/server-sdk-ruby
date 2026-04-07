# frozen_string_literal: true

module Vapi
  module Types
    module JsonQueryOnCallTableWithNumberTypeColumnColumn
      extend Vapi::Internal::Types::Enum

      COST = "cost"
      DURATION = "duration"
      AVERAGE_MODEL_LATENCY = "averageModelLatency"
      AVERAGE_VOICE_LATENCY = "averageVoiceLatency"
      AVERAGE_TRANSCRIBER_LATENCY = "averageTranscriberLatency"
      AVERAGE_TURN_LATENCY = "averageTurnLatency"
      AVERAGE_ENDPOINTING_LATENCY = "averageEndpointingLatency"
      ARTIFACT_STRUCTURED_OUTPUTS_OUTPUT_ID = "artifact.structuredOutputs[OutputID]"
    end
  end
end
