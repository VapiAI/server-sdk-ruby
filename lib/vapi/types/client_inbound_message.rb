# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessage < Internal::Types::Model
      field :message, -> { Vapi::Types::ClientInboundMessageMessage }, optional: false, nullable: false
    end
  end
end
