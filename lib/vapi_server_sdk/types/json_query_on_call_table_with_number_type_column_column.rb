# frozen_string_literal: true

module Vapi
  # This is the column that will be queried in the selected table.
  #  Available columns depend on the selected table.
  #  Number Type columns are columns where the rows store Number data
  class JsonQueryOnCallTableWithNumberTypeColumnColumn
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
