# frozen_string_literal: true

module Vapi
  # This is the reason for the eval run to end.
  #  When the eval run is completed normally i.e end of mock conversation, the status
  #  is 'mockConversation.done'.
  #  When the eval fails due to an error like Chat error or incorrect configuration,
  #  the status is 'error'.
  #  When the eval runs for too long, due to model issues or tool call issues, the
  #  status is 'timeout'.
  #  When the eval run is cancelled by the user, the status is 'cancelled'.
  #  When the eval run is cancelled by Vapi for any reason, the status is 'aborted'.
  class EvalRunEndedReason
    MOCK_CONVERSATION_DONE = "mockConversation.done"
    ERROR = "error"
    TIMEOUT = "timeout"
    CANCELLED = "cancelled"
    ABORTED = "aborted"
  end
end
