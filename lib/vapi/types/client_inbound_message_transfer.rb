# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessageTransfer < Internal::Types::Model
      field :destination, -> { Vapi::Types::ClientInboundMessageTransferDestination }, optional: true, nullable: false
      field :content, -> { String }, optional: true, nullable: false
    end
  end
end
