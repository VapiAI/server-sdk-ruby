# frozen_string_literal: true

module Vapi
  module Types
    # These are all the messages that can be sent to the client-side SDKs during the call. Configure the messages you'd
    # like to receive in `assistant.clientMessages`.
    class ClientMessageMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::ClientMessageWorkflowNodeStarted }
      member -> { Vapi::Types::ClientMessageAssistantStarted }
      member -> { Vapi::Types::ClientMessageConversationUpdate }
      member -> { Vapi::Types::ClientMessageHang }
      member -> { Vapi::Types::ClientMessageMetadata }
      member -> { Vapi::Types::ClientMessageModelOutput }
      member -> { Vapi::Types::ClientMessageSpeechUpdate }
      member -> { Vapi::Types::ClientMessageTranscript }
      member -> { Vapi::Types::ClientMessageToolCalls }
      member -> { Vapi::Types::ClientMessageToolCallsResult }
      member -> { Vapi::Types::ClientMessageTransferUpdate }
      member -> { Vapi::Types::ClientMessageUserInterrupted }
      member -> { Vapi::Types::ClientMessageLanguageChangeDetected }
      member -> { Vapi::Types::ClientMessageVoiceInput }
      member -> { Vapi::Types::ClientMessageAssistantSpeech }
      member -> { Vapi::Types::ClientMessageChatCreated }
      member -> { Vapi::Types::ClientMessageChatDeleted }
      member -> { Vapi::Types::ClientMessageSessionCreated }
      member -> { Vapi::Types::ClientMessageSessionUpdated }
      member -> { Vapi::Types::ClientMessageSessionDeleted }
      member -> { Vapi::Types::ClientMessageCallDeleted }
      member -> { Vapi::Types::ClientMessageCallDeleteFailed }
    end
  end
end
