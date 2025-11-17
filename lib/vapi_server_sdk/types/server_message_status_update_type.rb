# frozen_string_literal: true

module Vapi
  # This is the type of the message. "status-update" is sent whenever the
  #  `call.status` changes.
  class ServerMessageStatusUpdateType
    STATUS_UPDATE = "status-update"
  end
end
