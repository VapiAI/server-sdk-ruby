# frozen_string_literal: true

module Vapi
  module Types
    class Chat < Internal::Types::Model
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
      field :input, -> { Vapi::Types::ChatInput }, optional: true, nullable: false
      field :stream, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :previous_chat_id, -> { String }, optional: true, nullable: false, api_name: "previousChatId"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :messages, -> { Internal::Types::Array[Vapi::Types::ChatMessagesItem] }, optional: true, nullable: false
      field :output, -> { Internal::Types::Array[Vapi::Types::ChatOutputItem] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :costs, -> { Internal::Types::Array[Vapi::Types::ChatCostsItem] }, optional: true, nullable: false
      field :cost, -> { Integer }, optional: true, nullable: false
    end
  end
end
