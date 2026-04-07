# frozen_string_literal: true

module Vapi
  module Types
    # This is the response that is expected from the server to the message.
    #
    # Note: Most messages don't expect a response. Only "assistant-request", "tool-calls" and
    # "transfer-destination-request" do.
    class ServerMessageResponseMessageResponse < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::ServerMessageResponseAssistantRequest }
      member -> { Vapi::Types::ServerMessageResponseHandoffDestinationRequest }
      member -> { Vapi::Types::ServerMessageResponseKnowledgeBaseRequest }
      member -> { Vapi::Types::ServerMessageResponseToolCalls }
      member -> { Vapi::Types::ServerMessageResponseTransferDestinationRequest }
      member -> { Vapi::Types::ServerMessageResponseVoiceRequest }
      member -> { Vapi::Types::ServerMessageResponseCallEndpointingRequest }
    end
  end
end
