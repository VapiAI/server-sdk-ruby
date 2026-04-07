# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageCallEndpointingRequest < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageCallEndpointingRequestPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageCallEndpointingRequestType }, optional: false, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::ServerMessageCallEndpointingRequestMessagesItem] }, optional: true, nullable: false
      field :messages_open_ai_formatted, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: false, nullable: false, api_name: "messagesOpenAIFormatted"
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
    end
  end
end
