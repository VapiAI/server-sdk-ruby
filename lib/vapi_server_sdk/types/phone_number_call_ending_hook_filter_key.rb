# frozen_string_literal: true

module Vapi
  # This is the key to filter on - only "call.endedReason" is allowed for phone
  #  number call ending hooks
  class PhoneNumberCallEndingHookFilterKey
    CALL_ENDED_REASON = "call.endedReason"
  end
end
