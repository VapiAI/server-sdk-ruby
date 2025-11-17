# frozen_string_literal: true

module Vapi
  # This is the column in the call table that will be filtered on.
  #  String Type columns are columns where the rows store data as a string.
  #  Must be a valid column for the selected table.
  class FilterStringTypeColumnOnCallTableColumn
    ASSISTANT_ID = "assistantId"
    WORKFLOW_ID = "workflowId"
    SQUAD_ID = "squadId"
    PHONE_NUMBER_ID = "phoneNumberId"
    TYPE = "type"
    CUSTOMER_NUMBER = "customerNumber"
    STATUS = "status"
    ENDED_REASON = "endedReason"
    FORWARDED_PHONE_NUMBER = "forwardedPhoneNumber"
    CAMPAIGN_ID = "campaignId"
  end
end
