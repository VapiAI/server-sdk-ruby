# frozen_string_literal: true

module Vapi
  module Types
    # This is the message that will be spoken to the user as the tool is running.
    class ServerMessageResponseTransferDestinationRequestMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ToolMessageStart }, key: "REQUEST_START"
      member -> { Vapi::Types::ToolMessageComplete }, key: "REQUEST_COMPLETE"
      member -> { Vapi::Types::ToolMessageFailed }, key: "REQUEST_FAILED"
      member -> { Vapi::Types::ToolMessageDelayed }, key: "REQUEST_RESPONSE_DELAYED"
    end
  end
end
