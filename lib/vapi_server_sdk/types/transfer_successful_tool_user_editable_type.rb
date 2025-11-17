# frozen_string_literal: true

module Vapi
  # The type of tool. "transferSuccessful" for Transfer Successful tool. This tool
  #  can only be used during warm-transfer-experimental by the transfer assistant to
  #  confirm that the transfer should proceed and finalize the handoff to the
  #  destination.
  class TransferSuccessfulToolUserEditableType
    TRANSFER_SUCCESSFUL = "transferSuccessful"
  end
end
