# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessageControl < Internal::Types::Model
      field :control, -> { Vapi::Types::ClientInboundMessageControlControl }, optional: false, nullable: false
    end
  end
end
