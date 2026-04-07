# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseTransferDestinationRequest < Internal::Types::Model
      field :destination, -> { Vapi::Types::ServerMessageResponseTransferDestinationRequestDestination }, optional: true, nullable: false
      field :message, -> { Vapi::Types::ServerMessageResponseTransferDestinationRequestMessage }, optional: true, nullable: false
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
