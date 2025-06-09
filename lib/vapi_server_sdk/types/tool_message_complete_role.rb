# frozen_string_literal: true

module Vapi
# This is optional and defaults to "assistant".
#  When role=assistant, `content` is said out loud.
#  When role=system, `content` is passed to the model in a system message. Example:
#  system: default one
#  assistant:
#  user:
#  assistant:
#  user:
#  assistant:
#  user:
#  assistant: tool called
#  tool: your server response
#  <--- system prompt as hint
#  ---> model generates response which is spoken
#  This is useful when you want to provide a hint to the model about what to say
#  next.
  class ToolMessageCompleteRole

    ASSISTANT = "assistant"
    SYSTEM = "system"

  end
end