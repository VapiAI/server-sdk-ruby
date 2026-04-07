# frozen_string_literal: true

module Vapi
  module Types
    class CreateMcpToolDtoMessagesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ToolMessageStart }, key: "REQUEST_START"
      member -> { Vapi::Types::ToolMessageComplete }, key: "REQUEST_COMPLETE"
      member -> { Vapi::Types::ToolMessageFailed }, key: "REQUEST_FAILED"
      member -> { Vapi::Types::ToolMessageDelayed }, key: "REQUEST_RESPONSE_DELAYED"
    end
  end
end
