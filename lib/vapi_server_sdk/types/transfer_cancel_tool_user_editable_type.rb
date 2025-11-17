# frozen_string_literal: true

module Vapi
  # The type of tool. "transferCancel" for Transfer Cancel tool. This tool can only
  #  be used during warm-transfer-experimental by the transfer assistant to cancel an
  #  ongoing transfer and return the call back to the original assistant when the
  #  transfer cannot be completed.
  class TransferCancelToolUserEditableType
    TRANSFER_CANCEL = "transferCancel"
  end
end
