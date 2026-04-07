# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponse < Internal::Types::Model
      field :message_response, -> { Vapi::Types::ServerMessageResponseMessageResponse }, optional: false, nullable: false, api_name: "messageResponse"
    end
  end
end
