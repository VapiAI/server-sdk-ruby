# frozen_string_literal: true

require "json"
require_relative "server_message_assistant_request"
require_relative "server_message_conversation_update"
require_relative "server_message_end_of_call_report"
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
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ServerMessageMessage]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ServerMessageMessage
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "assistant-request"
                 Vapi::ServerMessageAssistantRequest.from_json(json_object: json_object)
               when "conversation-update"
                 Vapi::ServerMessageConversationUpdate.from_json(json_object: json_object)
               when "end-of-call-report"
                 Vapi::ServerMessageEndOfCallReport.from_json(json_object: json_object)
               when "hang"
                 Vapi::ServerMessageHang.from_json(json_object: json_object)
               when "knowledge-base-request"
                 Vapi::ServerMessageKnowledgeBaseRequest.from_json(json_object: json_object)
               when "model-output"
                 Vapi::ServerMessageModelOutput.from_json(json_object: json_object)
               when "phone-call-control"
                 Vapi::ServerMessagePhoneCallControl.from_json(json_object: json_object)
               when "speech-update"
                 Vapi::ServerMessageSpeechUpdate.from_json(json_object: json_object)
               when "status-update"
                 Vapi::ServerMessageStatusUpdate.from_json(json_object: json_object)
               when "tool-calls"
                 Vapi::ServerMessageToolCalls.from_json(json_object: json_object)
               when "transfer-destination-request"
                 Vapi::ServerMessageTransferDestinationRequest.from_json(json_object: json_object)
               when "transfer-update"
                 Vapi::ServerMessageTransferUpdate.from_json(json_object: json_object)
               when "transcript[transcriptType='final']"
                 Vapi::ServerMessageTranscript.from_json(json_object: json_object)
               when "user-interrupted"
                 Vapi::ServerMessageUserInterrupted.from_json(json_object: json_object)
               when "language-change-detected"
                 Vapi::ServerMessageLanguageChangeDetected.from_json(json_object: json_object)
               when "voice-input"
                 Vapi::ServerMessageVoiceInput.from_json(json_object: json_object)
               when "voice-request"
                 Vapi::ServerMessageVoiceRequest.from_json(json_object: json_object)
               when "call.endpointing.request"
                 Vapi::ServerMessageCallEndpointingRequest.from_json(json_object: json_object)
               else
                 Vapi::ServerMessageAssistantRequest.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "assistant-request"
        { **@member.to_json, type: @discriminant }.to_json
      when "conversation-update"
        { **@member.to_json, type: @discriminant }.to_json
      when "end-of-call-report"
        { **@member.to_json, type: @discriminant }.to_json
      when "hang"
        { **@member.to_json, type: @discriminant }.to_json
      when "knowledge-base-request"
        { **@member.to_json, type: @discriminant }.to_json
      when "model-output"
        { **@member.to_json, type: @discriminant }.to_json
      when "phone-call-control"
        { **@member.to_json, type: @discriminant }.to_json
      when "speech-update"
        { **@member.to_json, type: @discriminant }.to_json
      when "status-update"
        { **@member.to_json, type: @discriminant }.to_json
      when "tool-calls"
        { **@member.to_json, type: @discriminant }.to_json
      when "transfer-destination-request"
        { **@member.to_json, type: @discriminant }.to_json
      when "transfer-update"
        { **@member.to_json, type: @discriminant }.to_json
      when "transcript[transcriptType='final']"
        { **@member.to_json, type: @discriminant }.to_json
      when "user-interrupted"
        { **@member.to_json, type: @discriminant }.to_json
      when "language-change-detected"
        { **@member.to_json, type: @discriminant }.to_json
      when "voice-input"
        { **@member.to_json, type: @discriminant }.to_json
      when "voice-request"
        { **@member.to_json, type: @discriminant }.to_json
      when "call.endpointing.request"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "assistant-request"
        Vapi::ServerMessageAssistantRequest.validate_raw(obj: obj)
      when "conversation-update"
        Vapi::ServerMessageConversationUpdate.validate_raw(obj: obj)
      when "end-of-call-report"
        Vapi::ServerMessageEndOfCallReport.validate_raw(obj: obj)
      when "hang"
        Vapi::ServerMessageHang.validate_raw(obj: obj)
      when "knowledge-base-request"
        Vapi::ServerMessageKnowledgeBaseRequest.validate_raw(obj: obj)
      when "model-output"
        Vapi::ServerMessageModelOutput.validate_raw(obj: obj)
      when "phone-call-control"
        Vapi::ServerMessagePhoneCallControl.validate_raw(obj: obj)
      when "speech-update"
        Vapi::ServerMessageSpeechUpdate.validate_raw(obj: obj)
      when "status-update"
        Vapi::ServerMessageStatusUpdate.validate_raw(obj: obj)
      when "tool-calls"
        Vapi::ServerMessageToolCalls.validate_raw(obj: obj)
      when "transfer-destination-request"
        Vapi::ServerMessageTransferDestinationRequest.validate_raw(obj: obj)
      when "transfer-update"
        Vapi::ServerMessageTransferUpdate.validate_raw(obj: obj)
      when "transcript[transcriptType='final']"
        Vapi::ServerMessageTranscript.validate_raw(obj: obj)
      when "user-interrupted"
        Vapi::ServerMessageUserInterrupted.validate_raw(obj: obj)
      when "language-change-detected"
        Vapi::ServerMessageLanguageChangeDetected.validate_raw(obj: obj)
      when "voice-input"
        Vapi::ServerMessageVoiceInput.validate_raw(obj: obj)
      when "voice-request"
        Vapi::ServerMessageVoiceRequest.validate_raw(obj: obj)
      when "call.endpointing.request"
        Vapi::ServerMessageCallEndpointingRequest.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::ServerMessageAssistantRequest]
    # @return [Vapi::ServerMessageMessage]
    def self.assistant_request(member:)
      new(member: member, discriminant: "assistant-request")
    end

    # @param member [Vapi::ServerMessageConversationUpdate]
    # @return [Vapi::ServerMessageMessage]
    def self.conversation_update(member:)
      new(member: member, discriminant: "conversation-update")
    end

    # @param member [Vapi::ServerMessageEndOfCallReport]
    # @return [Vapi::ServerMessageMessage]
    def self.end_of_call_report(member:)
      new(member: member, discriminant: "end-of-call-report")
    end

    # @param member [Vapi::ServerMessageHang]
    # @return [Vapi::ServerMessageMessage]
    def self.hang(member:)
      new(member: member, discriminant: "hang")
    end

    # @param member [Vapi::ServerMessageKnowledgeBaseRequest]
    # @return [Vapi::ServerMessageMessage]
    def self.knowledge_base_request(member:)
      new(member: member, discriminant: "knowledge-base-request")
    end

    # @param member [Vapi::ServerMessageModelOutput]
    # @return [Vapi::ServerMessageMessage]
    def self.model_output(member:)
      new(member: member, discriminant: "model-output")
    end

    # @param member [Vapi::ServerMessagePhoneCallControl]
    # @return [Vapi::ServerMessageMessage]
    def self.phone_call_control(member:)
      new(member: member, discriminant: "phone-call-control")
    end

    # @param member [Vapi::ServerMessageSpeechUpdate]
    # @return [Vapi::ServerMessageMessage]
    def self.speech_update(member:)
      new(member: member, discriminant: "speech-update")
    end

    # @param member [Vapi::ServerMessageStatusUpdate]
    # @return [Vapi::ServerMessageMessage]
    def self.status_update(member:)
      new(member: member, discriminant: "status-update")
    end

    # @param member [Vapi::ServerMessageToolCalls]
    # @return [Vapi::ServerMessageMessage]
    def self.tool_calls(member:)
      new(member: member, discriminant: "tool-calls")
    end

    # @param member [Vapi::ServerMessageTransferDestinationRequest]
    # @return [Vapi::ServerMessageMessage]
    def self.transfer_destination_request(member:)
      new(member: member, discriminant: "transfer-destination-request")
    end

    # @param member [Vapi::ServerMessageTransferUpdate]
    # @return [Vapi::ServerMessageMessage]
    def self.transfer_update(member:)
      new(member: member, discriminant: "transfer-update")
    end

    # @param member [Vapi::ServerMessageTranscript]
    # @return [Vapi::ServerMessageMessage]
    def self.transcript_transcript_type_final(member:)
      new(member: member, discriminant: "transcript[transcriptType='final']")
    end

    # @param member [Vapi::ServerMessageUserInterrupted]
    # @return [Vapi::ServerMessageMessage]
    def self.user_interrupted(member:)
      new(member: member, discriminant: "user-interrupted")
    end

    # @param member [Vapi::ServerMessageLanguageChangeDetected]
    # @return [Vapi::ServerMessageMessage]
    def self.language_change_detected(member:)
      new(member: member, discriminant: "language-change-detected")
    end

    # @param member [Vapi::ServerMessageVoiceInput]
    # @return [Vapi::ServerMessageMessage]
    def self.voice_input(member:)
      new(member: member, discriminant: "voice-input")
    end

    # @param member [Vapi::ServerMessageVoiceRequest]
    # @return [Vapi::ServerMessageMessage]
    def self.voice_request(member:)
      new(member: member, discriminant: "voice-request")
    end

    # @param member [Vapi::ServerMessageCallEndpointingRequest]
    # @return [Vapi::ServerMessageMessage]
    def self.call_endpointing_request(member:)
      new(member: member, discriminant: "call.endpointing.request")
    end
  end
end
