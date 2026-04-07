# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessageSendTransportMessage < Internal::Types::Model
      field :message, -> { Vapi::Types::ClientInboundMessageSendTransportMessageMessage }, optional: false, nullable: false
    end
  end
end
