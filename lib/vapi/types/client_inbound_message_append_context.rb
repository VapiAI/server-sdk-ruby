# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessageAppendContext < Internal::Types::Model
      field :kind, -> { Vapi::Types::ClientInboundMessageAppendContextKind }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
