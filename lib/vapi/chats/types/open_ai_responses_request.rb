# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      class OpenAiResponsesRequest < Internal::Types::Model
        field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
        field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
        field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
        field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
        field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
        field :input, -> { Vapi::Chats::Types::OpenAiResponsesRequestInput }, optional: false, nullable: false
        field :stream, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :previous_chat_id, -> { String }, optional: true, nullable: false, api_name: "previousChatId"
        field :transport, -> { Vapi::Types::TwilioSmsChatTransport }, optional: true, nullable: false
      end
    end
  end
end
