# frozen_string_literal: true

module Vapi
  # This configures how transfer is executed and the experience of the destination
  #  party receiving the call.
  #  Usage:
  #  - `blind-transfer`: The assistant forwards the call to the destination without
  #  any message or summary.
  #  - `blind-transfer-add-summary-to-sip-header`: The assistant forwards the call to
  #  the destination and adds a SIP header X-Transfer-Summary to the call to include
  #  the summary.
  #  - `warm-transfer-say-message`: The assistant dials the destination, delivers the
  #  `message` to the destination party, connects the customer, and leaves the call.
  #  - `warm-transfer-say-summary`: The assistant dials the destination, provides a
  #  summary of the call to the destination party, connects the customer, and leaves
  #  the call.
  #  - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`: The
  #  assistant dials the destination, waits for the operator to speak, delivers the
  #  `message` to the destination party, and then connects the customer.
  #  - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`: The
  #  assistant dials the destination, waits for the operator to speak, provides a
  #  summary of the call to the destination party, and then connects the customer.
  #  @default 'blind-transfer'
  class TransferPlanMode
    BLIND_TRANSFER = "blind-transfer"
    BLIND_TRANSFER_ADD_SUMMARY_TO_SIP_HEADER = "blind-transfer-add-summary-to-sip-header"
    WARM_TRANSFER_SAY_MESSAGE = "warm-transfer-say-message"
    WARM_TRANSFER_SAY_SUMMARY = "warm-transfer-say-summary"
    WARM_TRANSFER_WAIT_FOR_OPERATOR_TO_SPEAK_FIRST_AND_THEN_SAY_MESSAGE = "warm-transfer-wait-for-operator-to-speak-first-and-then-say-message"
    WARM_TRANSFER_WAIT_FOR_OPERATOR_TO_SPEAK_FIRST_AND_THEN_SAY_SUMMARY = "warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary"
  end
end
