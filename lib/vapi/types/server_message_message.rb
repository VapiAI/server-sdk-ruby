# frozen_string_literal: true

module Vapi
  module Types
    # These are all the messages that can be sent to your server before, after and during the call. Configure the
    # messages you'd like to receive in `assistant.serverMessages`.
    #
    # The server where the message is sent is determined by the following precedence order:
    #
    # 1. `tool.server.url` (if configured, and only for "tool-calls" message)
    # 2. `assistant.serverUrl` (if configure)
    # 3. `phoneNumber.serverUrl` (if configured)
    # 4. `org.serverUrl` (if configured)
    class ServerMessageMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::ServerMessageAssistantRequest }
      member -> { Vapi::Types::ServerMessageConversationUpdate }
      member -> { Vapi::Types::ServerMessageEndOfCallReport }
      member -> { Vapi::Types::ServerMessageHandoffDestinationRequest }
      member -> { Vapi::Types::ServerMessageHang }
      member -> { Vapi::Types::ServerMessageKnowledgeBaseRequest }
      member -> { Vapi::Types::ServerMessageModelOutput }
      member -> { Vapi::Types::ServerMessagePhoneCallControl }
      member -> { Vapi::Types::ServerMessageSpeechUpdate }
      member -> { Vapi::Types::ServerMessageStatusUpdate }
      member -> { Vapi::Types::ServerMessageToolCalls }
      member -> { Vapi::Types::ServerMessageTransferDestinationRequest }
      member -> { Vapi::Types::ServerMessageTransferUpdate }
      member -> { Vapi::Types::ServerMessageTranscript }
      member -> { Vapi::Types::ServerMessageUserInterrupted }
      member -> { Vapi::Types::ServerMessageLanguageChangeDetected }
      member -> { Vapi::Types::ServerMessageVoiceInput }
      member -> { Vapi::Types::ServerMessageAssistantSpeech }
      member -> { Vapi::Types::ServerMessageVoiceRequest }
      member -> { Vapi::Types::ServerMessageCallEndpointingRequest }
      member -> { Vapi::Types::ServerMessageChatCreated }
      member -> { Vapi::Types::ServerMessageChatDeleted }
      member -> { Vapi::Types::ServerMessageSessionCreated }
      member -> { Vapi::Types::ServerMessageSessionUpdated }
      member -> { Vapi::Types::ServerMessageSessionDeleted }
      member -> { Vapi::Types::ServerMessageCallDeleted }
      member -> { Vapi::Types::ServerMessageCallDeleteFailed }
    end
  end
end
