# frozen_string_literal: true

require "json"
require_relative "server_message_assistant_request"
require_relative "server_message_conversation_update"
require_relative "server_message_end_of_call_report"
require_relative "server_message_handoff_destination_request"
require_relative "server_message_hang"
require_relative "server_message_knowledge_base_request"
require_relative "server_message_model_output"
require_relative "server_message_phone_call_control"
require_relative "server_message_speech_update"
require_relative "server_message_status_update"
require_relative "server_message_tool_calls"
require_relative "server_message_transfer_destination_request"
require_relative "server_message_transfer_update"
require_relative "server_message_transcript"
require_relative "server_message_user_interrupted"
require_relative "server_message_language_change_detected"
require_relative "server_message_voice_input"
require_relative "server_message_voice_request"
require_relative "server_message_call_endpointing_request"
require_relative "server_message_chat_created"
require_relative "server_message_chat_deleted"
require_relative "server_message_session_created"
require_relative "server_message_session_updated"
require_relative "server_message_session_deleted"
require_relative "server_message_call_deleted"
require_relative "server_message_call_delete_failed"

module Vapi
  # These are all the messages that can be sent to your server before, after and
  #  during the call. Configure the messages you'd like to receive in
  #  `assistant.serverMessages`.
  #  The server where the message is sent is determined by the following precedence
  #  order:
  #  1. `tool.server.url` (if configured, and only for "tool-calls" message)
  #  2. `assistant.serverUrl` (if configure)
  #  3. `phoneNumber.serverUrl` (if configured)
  #  4. `org.serverUrl` (if configured)
  class ServerMessageMessage
    # Deserialize a JSON object to an instance of ServerMessageMessage
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ServerMessageAssistantRequest.validate_raw(obj: struct)
        return Vapi::ServerMessageAssistantRequest.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageConversationUpdate.validate_raw(obj: struct)
        return Vapi::ServerMessageConversationUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageEndOfCallReport.validate_raw(obj: struct)
        return Vapi::ServerMessageEndOfCallReport.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageHandoffDestinationRequest.validate_raw(obj: struct)
        return Vapi::ServerMessageHandoffDestinationRequest.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageHang.validate_raw(obj: struct)
        return Vapi::ServerMessageHang.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageKnowledgeBaseRequest.validate_raw(obj: struct)
        return Vapi::ServerMessageKnowledgeBaseRequest.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageModelOutput.validate_raw(obj: struct)
        return Vapi::ServerMessageModelOutput.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessagePhoneCallControl.validate_raw(obj: struct)
        return Vapi::ServerMessagePhoneCallControl.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageSpeechUpdate.validate_raw(obj: struct)
        return Vapi::ServerMessageSpeechUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageStatusUpdate.validate_raw(obj: struct)
        return Vapi::ServerMessageStatusUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageToolCalls.validate_raw(obj: struct)
        return Vapi::ServerMessageToolCalls.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageTransferDestinationRequest.validate_raw(obj: struct)
        return Vapi::ServerMessageTransferDestinationRequest.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageTransferUpdate.validate_raw(obj: struct)
        return Vapi::ServerMessageTransferUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageTranscript.validate_raw(obj: struct)
        return Vapi::ServerMessageTranscript.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageUserInterrupted.validate_raw(obj: struct)
        return Vapi::ServerMessageUserInterrupted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageLanguageChangeDetected.validate_raw(obj: struct)
        return Vapi::ServerMessageLanguageChangeDetected.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageVoiceInput.validate_raw(obj: struct)
        return Vapi::ServerMessageVoiceInput.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageVoiceRequest.validate_raw(obj: struct)
        return Vapi::ServerMessageVoiceRequest.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageCallEndpointingRequest.validate_raw(obj: struct)
        return Vapi::ServerMessageCallEndpointingRequest.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageChatCreated.validate_raw(obj: struct)
        return Vapi::ServerMessageChatCreated.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageChatDeleted.validate_raw(obj: struct)
        return Vapi::ServerMessageChatDeleted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageSessionCreated.validate_raw(obj: struct)
        return Vapi::ServerMessageSessionCreated.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageSessionUpdated.validate_raw(obj: struct)
        return Vapi::ServerMessageSessionUpdated.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageSessionDeleted.validate_raw(obj: struct)
        return Vapi::ServerMessageSessionDeleted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageCallDeleted.validate_raw(obj: struct)
        return Vapi::ServerMessageCallDeleted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageCallDeleteFailed.validate_raw(obj: struct)
        return Vapi::ServerMessageCallDeleteFailed.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vapi::ServerMessageAssistantRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageConversationUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageEndOfCallReport.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageHandoffDestinationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageHang.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageKnowledgeBaseRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageModelOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessagePhoneCallControl.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageSpeechUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageStatusUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageToolCalls.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageTransferDestinationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageTransferUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageTranscript.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageUserInterrupted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageLanguageChangeDetected.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageVoiceInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageVoiceRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageCallEndpointingRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageChatCreated.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageChatDeleted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageSessionCreated.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageSessionUpdated.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageSessionDeleted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageCallDeleted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageCallDeleteFailed.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
