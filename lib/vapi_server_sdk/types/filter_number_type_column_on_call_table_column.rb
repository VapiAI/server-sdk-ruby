# frozen_string_literal: true

module Vapi
  # This is the column in the call table that will be filtered on.
  #  Number Type columns are columns where the rows store data as a number.
  #  Must be a valid column for the selected table.
  class FilterNumberTypeColumnOnCallTableColumn
    DURATION = "duration"
    COST = "cost"
    AVERAGE_MODEL_LATENCY = "averageModelLatency"
    AVERAGE_VOICE_LATENCY = "averageVoiceLatency"
    AVERAGE_TRANSCRIBER_LATENCY = "averageTranscriberLatency"
    AVERAGE_TURN_LATENCY = "averageTurnLatency"
    AVERAGE_ENDPOINTING_LATENCY = "averageEndpointingLatency"
  end
end
