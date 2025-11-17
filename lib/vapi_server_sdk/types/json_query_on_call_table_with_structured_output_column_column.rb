# frozen_string_literal: true

module Vapi
  # This is the column that will be queried in the call table.
  #  Structured Output Type columns are only to query on
  #  artifact.structuredOutputs[OutputID] column.
  class JsonQueryOnCallTableWithStructuredOutputColumnColumn
    ARTIFACT_STRUCTURED_OUTPUTS_OUTPUT_ID = "artifact.structuredOutputs[OutputID]"
  end
end
