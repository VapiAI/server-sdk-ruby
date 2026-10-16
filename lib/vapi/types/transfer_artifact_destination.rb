# frozen_string_literal: true

module Vapi
  module Types
    # The transfer destination (phone number or SIP URI).
    class TransferArtifactDestination < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransferDestinationNumber }, key: "NUMBER"
      member -> { Vapi::Types::TransferDestinationSip }, key: "SIP"
    end
  end
end
