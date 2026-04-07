# frozen_string_literal: true

module Vapi
  module Types
    class CreateTransferCallToolDtoDestinationsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationAssistant }, key: "ASSISTANT"
      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
