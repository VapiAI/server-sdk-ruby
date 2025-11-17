# frozen_string_literal: true

module Vapi
  # This is the column in the call table that will be filtered on.
  #  Number Array Type columns are the same as Number Type columns, but provides the
  #  ability to filter on multiple values provided as an array.
  #  Must be a valid column for the selected table.
  class FilterNumberArrayTypeColumnOnCallTableColumn
    DURATION = "duration"
    COST = "cost"
    AVERAGE_MODEL_LATENCY = "averageModelLatency"
    AVERAGE_VOICE_LATENCY = "averageVoiceLatency"
    AVERAGE_TRANSCRIBER_LATENCY = "averageTranscriberLatency"
    AVERAGE_TURN_LATENCY = "averageTurnLatency"
    AVERAGE_ENDPOINTING_LATENCY = "averageEndpointingLatency"
  end
end
