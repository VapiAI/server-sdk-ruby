# frozen_string_literal: true

module Vapi
  module Types
    class VonageTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::VonageTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :conversation_uuid, -> { String }, optional: true, nullable: false, api_name: "conversationUUID"
      field :call_uuid, -> { String }, optional: true, nullable: false, api_name: "callUUID"
    end
  end
end
