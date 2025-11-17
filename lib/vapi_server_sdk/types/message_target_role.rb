# frozen_string_literal: true

module Vapi
  # This is the role of the message to target.
  #  If not specified, will find the position in the message history ignoring role
  #  (effectively `any`).
  class MessageTargetRole
    USER = "user"
    ASSISTANT = "assistant"
  end
end
