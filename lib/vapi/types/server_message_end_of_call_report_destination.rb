# frozen_string_literal: true

module Vapi
  module Types
    # This is the destination the call was transferred to, if the call was forwarded.
    # This can also be found at `call.destination` on GET /call/:id.
    class ServerMessageEndOfCallReportDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
