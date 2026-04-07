# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageStatusUpdate < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageStatusUpdatePhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageStatusUpdateType }, optional: false, nullable: false
      field :status, -> { Vapi::Types::ServerMessageStatusUpdateStatus }, optional: false, nullable: false
      field :ended_reason, -> { Vapi::Types::ServerMessageStatusUpdateEndedReason }, optional: true, nullable: false, api_name: "endedReason"
      field :messages, -> { Internal::Types::Array[Vapi::Types::ServerMessageStatusUpdateMessagesItem] }, optional: true, nullable: false
      field :messages_open_ai_formatted, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false, api_name: "messagesOpenAIFormatted"
      field :destination, -> { Vapi::Types::ServerMessageStatusUpdateDestination }, optional: true, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
      field :transcript, -> { String }, optional: true, nullable: false
      field :summary, -> { String }, optional: true, nullable: false
      field :inbound_phone_call_debugging_artifacts, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "inboundPhoneCallDebuggingArtifacts"
    end
  end
end
