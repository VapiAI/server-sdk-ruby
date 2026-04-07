# frozen_string_literal: true

module Vapi
  module Types
    # This is the fallback destination an inbound call will be transferred to if:
    # 1. `assistantId` is not set
    # 2. `squadId` is not set
    # 3. and, `assistant-request` message to the `serverUrl` fails
    #
    # If this is not set and above conditions are met, the inbound call is hung up with an error message.
    class UpdateByoPhoneNumberDtoFallbackDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
