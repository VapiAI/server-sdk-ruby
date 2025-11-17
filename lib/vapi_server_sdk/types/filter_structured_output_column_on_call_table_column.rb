# frozen_string_literal: true

module Vapi
  # This is the column in the call table that will be filtered on.
  #  Structured Output Type columns are only to filter on
  #  artifact.structuredOutputs[OutputID] column.
  class FilterStructuredOutputColumnOnCallTableColumn
    ARTIFACT_STRUCTURED_OUTPUTS_OUTPUT_ID = "artifact.structuredOutputs[OutputID]"
  end
end
