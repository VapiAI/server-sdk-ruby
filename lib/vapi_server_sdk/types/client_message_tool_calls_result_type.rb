# frozen_string_literal: true

module Vapi
  # This is the type of the message. "tool-calls-result" is sent to forward the
  #  result of a tool call to the client.
  class ClientMessageToolCallsResultType
    TOOL_CALLS_RESULT = "tool-calls-result"
  end
end
