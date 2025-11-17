# frozen_string_literal: true

module Vapi
  # This is the column in the call table that will be filtered on.
  #  String Array Type columns are the same as String Type columns, but provides the
  #  ability to filter on multiple values provided as an array.
  #  Must be a valid column for the selected table.
  class FilterStringArrayTypeColumnOnCallTableColumn
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
