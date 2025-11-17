# frozen_string_literal: true

require "json"
require_relative "client_message_workflow_node_started"
require_relative "client_message_assistant_started"
require_relative "client_message_conversation_update"
require_relative "client_message_hang"
require_relative "client_message_metadata"
require_relative "client_message_model_output"
require_relative "client_message_speech_update"
require_relative "client_message_transcript"
require_relative "client_message_tool_calls"
require_relative "client_message_tool_calls_result"
require_relative "client_message_transfer_update"
require_relative "client_message_user_interrupted"
require_relative "client_message_language_change_detected"
require_relative "client_message_voice_input"
require_relative "client_message_chat_created"
require_relative "client_message_chat_deleted"
require_relative "client_message_session_created"
require_relative "client_message_session_updated"
require_relative "client_message_session_deleted"
require_relative "client_message_call_deleted"
require_relative "client_message_call_delete_failed"

module Vapi
  # These are all the messages that can be sent to the client-side SDKs during the
  #  call. Configure the messages you'd like to receive in
  #  `assistant.clientMessages`.
  class ClientMessageMessage
    # Deserialize a JSON object to an instance of ClientMessageMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ClientMessageWorkflowNodeStarted.validate_raw(obj: struct)
        return Vapi::ClientMessageWorkflowNodeStarted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageAssistantStarted.validate_raw(obj: struct)
        return Vapi::ClientMessageAssistantStarted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageConversationUpdate.validate_raw(obj: struct)
        return Vapi::ClientMessageConversationUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageHang.validate_raw(obj: struct)
        return Vapi::ClientMessageHang.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageMetadata.validate_raw(obj: struct)
        return Vapi::ClientMessageMetadata.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageModelOutput.validate_raw(obj: struct)
        return Vapi::ClientMessageModelOutput.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageSpeechUpdate.validate_raw(obj: struct)
        return Vapi::ClientMessageSpeechUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageTranscript.validate_raw(obj: struct)
        return Vapi::ClientMessageTranscript.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageToolCalls.validate_raw(obj: struct)
        return Vapi::ClientMessageToolCalls.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageToolCallsResult.validate_raw(obj: struct)
        return Vapi::ClientMessageToolCallsResult.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageTransferUpdate.validate_raw(obj: struct)
        return Vapi::ClientMessageTransferUpdate.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageUserInterrupted.validate_raw(obj: struct)
        return Vapi::ClientMessageUserInterrupted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageLanguageChangeDetected.validate_raw(obj: struct)
        return Vapi::ClientMessageLanguageChangeDetected.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageVoiceInput.validate_raw(obj: struct)
        return Vapi::ClientMessageVoiceInput.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageChatCreated.validate_raw(obj: struct)
        return Vapi::ClientMessageChatCreated.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageChatDeleted.validate_raw(obj: struct)
        return Vapi::ClientMessageChatDeleted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageSessionCreated.validate_raw(obj: struct)
        return Vapi::ClientMessageSessionCreated.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageSessionUpdated.validate_raw(obj: struct)
        return Vapi::ClientMessageSessionUpdated.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageSessionDeleted.validate_raw(obj: struct)
        return Vapi::ClientMessageSessionDeleted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageCallDeleted.validate_raw(obj: struct)
        return Vapi::ClientMessageCallDeleted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientMessageCallDeleteFailed.validate_raw(obj: struct)
        return Vapi::ClientMessageCallDeleteFailed.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::ClientMessageWorkflowNodeStarted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageAssistantStarted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageConversationUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageHang.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageMetadata.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageModelOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageSpeechUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageTranscript.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageToolCalls.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageToolCallsResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageTransferUpdate.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageUserInterrupted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageLanguageChangeDetected.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageVoiceInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageChatCreated.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageChatDeleted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageSessionCreated.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageSessionUpdated.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageSessionDeleted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageCallDeleted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientMessageCallDeleteFailed.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
