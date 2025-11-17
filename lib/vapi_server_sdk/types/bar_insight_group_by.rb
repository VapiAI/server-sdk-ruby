# frozen_string_literal: true

module Vapi
  # This is the group by column for the insight when table is `call`.
  #  These are the columns to group the results by.
  #  All results are grouped by the time range step by default.
  class BarInsightGroupBy
    ASSISTANT_ID = "assistantId"
    WORKFLOW_ID = "workflowId"
    SQUAD_ID = "squadId"
    PHONE_NUMBER_ID = "phoneNumberId"
    TYPE = "type"
    ENDED_REASON = "endedReason"
    CAMPAIGN_ID = "campaignId"
    ARTIFACT_STRUCTURED_OUTPUTS_OUTPUT_ID = "artifact.structuredOutputs[OutputID]"
  end
end
