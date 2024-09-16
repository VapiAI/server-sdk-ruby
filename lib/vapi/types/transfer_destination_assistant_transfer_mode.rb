# frozen_string_literal: true

module Vapi
  # This is the mode to use for the transfer. Default is `rolling-history`.
  #  - `rolling-history`: This is the default mode. It keeps the entire conversation
  #  history and appends the new assistant's system message on transfer.
  #  Example:
  #  Pre-transfer:
  #  system: assistant1 system message
  #  assistant: assistant1 first message
  #  user: hey, good morning
  #  assistant: how can i help?
  #  user: i need help with my account
  #  assistant: (destination.message)
  #  Post-transfer:
  #  system: assistant1 system message
  #  assistant: assistant1 first message
  #  user: hey, good morning
  #  assistant: how can i help?
  #  user: i need help with my account
  #  assistant: (destination.message)
  #  system: assistant2 system message
  #  assistant: assistant2 first message (or model generated if firstMessageMode is
  #  set to `assistant-speaks-first-with-model-generated-message`)
  #  - `swap-system-message-in-history`: This replaces the original system message
  #  with the new assistant's system message on transfer.
  #  Example:
  #  Pre-transfer:
  #  system: assistant1 system message
  #  assistant: assistant1 first message
  #  user: hey, good morning
  #  assistant: how can i help?
  #  user: i need help with my account
  #  assistant: (destination.message)
  #  Post-transfer:
  #  system: assistant2 system message
  #  assistant: assistant1 first message
  #  user: hey, good morning
  #  assistant: how can i help?
  #  user: i need help with my account
  #  assistant: (destination.message)
  #  assistant: assistant2 first message (or model generated if firstMessageMode is
  #  set to `assistant-speaks-first-with-model-generated-message`)
  class TransferDestinationAssistantTransferMode
    ROLLING_HISTORY = "rolling-history"
    SWAP_SYSTEM_MESSAGE_IN_HISTORY = "swap-system-message-in-history"
  end
end
