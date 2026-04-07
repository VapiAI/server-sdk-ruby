# frozen_string_literal: true

module Vapi
  module Types
    class RelayResponse < Internal::Types::Model
      field :status, -> { Vapi::Types::RelayResponseStatus }, optional: false, nullable: false
      field :call_id, -> { String }, optional: true, nullable: false, api_name: "callId"
      field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
      field :chat_id, -> { String }, optional: true, nullable: false, api_name: "chatId"
    end
  end
end
