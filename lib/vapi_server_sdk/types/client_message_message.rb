# frozen_string_literal: true

require "json"
require_relative "client_message_conversation_update"
require_relative "client_message_hang"
require_relative "client_message_metadata"
require_relative "client_message_model_output"
require_relative "client_message_speech_update"
require_relative "client_message_transcript"
require_relative "client_message_tool_calls"
require_relative "client_message_tool_calls_result"
require_relative "client_message_user_interrupted"
require_relative "client_message_language_changed"
require_relative "client_message_voice_input"

module Vapi
  # These are all the messages that can be sent to the client-side SDKs during the
  #  call. Configure the messages you'd like to receive in
  #  `assistant.clientMessages`.
  class ClientMessageMessage
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ClientMessageMessage]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ClientMessageMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "conversation-update"
                 Vapi::ClientMessageConversationUpdate.from_json(json_object: json_object)
               when "hang"
                 Vapi::ClientMessageHang.from_json(json_object: json_object)
               when "metadata"
                 Vapi::ClientMessageMetadata.from_json(json_object: json_object)
               when "model-output"
                 Vapi::ClientMessageModelOutput.from_json(json_object: json_object)
               when "speech-update"
                 Vapi::ClientMessageSpeechUpdate.from_json(json_object: json_object)
               when "transcript"
                 Vapi::ClientMessageTranscript.from_json(json_object: json_object)
               when "tool-calls"
                 Vapi::ClientMessageToolCalls.from_json(json_object: json_object)
               when "tool-calls-result"
                 Vapi::ClientMessageToolCallsResult.from_json(json_object: json_object)
               when "user-interrupted"
                 Vapi::ClientMessageUserInterrupted.from_json(json_object: json_object)
               when "language-changed"
                 Vapi::ClientMessageLanguageChanged.from_json(json_object: json_object)
               when "voice-input"
                 Vapi::ClientMessageVoiceInput.from_json(json_object: json_object)
               else
                 Vapi::ClientMessageConversationUpdate.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "conversation-update"
        { **@member.to_json, type: @discriminant }.to_json
      when "hang"
        { **@member.to_json, type: @discriminant }.to_json
      when "metadata"
        { **@member.to_json, type: @discriminant }.to_json
      when "model-output"
        { **@member.to_json, type: @discriminant }.to_json
      when "speech-update"
        { **@member.to_json, type: @discriminant }.to_json
      when "transcript"
        { **@member.to_json, type: @discriminant }.to_json
      when "tool-calls"
        { **@member.to_json, type: @discriminant }.to_json
      when "tool-calls-result"
        { **@member.to_json, type: @discriminant }.to_json
      when "user-interrupted"
        { **@member.to_json, type: @discriminant }.to_json
      when "language-changed"
        { **@member.to_json, type: @discriminant }.to_json
      when "voice-input"
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
      when "conversation-update"
        Vapi::ClientMessageConversationUpdate.validate_raw(obj: obj)
      when "hang"
        Vapi::ClientMessageHang.validate_raw(obj: obj)
      when "metadata"
        Vapi::ClientMessageMetadata.validate_raw(obj: obj)
      when "model-output"
        Vapi::ClientMessageModelOutput.validate_raw(obj: obj)
      when "speech-update"
        Vapi::ClientMessageSpeechUpdate.validate_raw(obj: obj)
      when "transcript"
        Vapi::ClientMessageTranscript.validate_raw(obj: obj)
      when "tool-calls"
        Vapi::ClientMessageToolCalls.validate_raw(obj: obj)
      when "tool-calls-result"
        Vapi::ClientMessageToolCallsResult.validate_raw(obj: obj)
      when "user-interrupted"
        Vapi::ClientMessageUserInterrupted.validate_raw(obj: obj)
      when "language-changed"
        Vapi::ClientMessageLanguageChanged.validate_raw(obj: obj)
      when "voice-input"
        Vapi::ClientMessageVoiceInput.validate_raw(obj: obj)
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

    # @param member [Vapi::ClientMessageConversationUpdate]
    # @return [Vapi::ClientMessageMessage]
    def self.conversation_update(member:)
      new(member: member, discriminant: "conversation-update")
    end

    # @param member [Vapi::ClientMessageHang]
    # @return [Vapi::ClientMessageMessage]
    def self.hang(member:)
      new(member: member, discriminant: "hang")
    end

    # @param member [Vapi::ClientMessageMetadata]
    # @return [Vapi::ClientMessageMessage]
    def self.metadata(member:)
      new(member: member, discriminant: "metadata")
    end

    # @param member [Vapi::ClientMessageModelOutput]
    # @return [Vapi::ClientMessageMessage]
    def self.model_output(member:)
      new(member: member, discriminant: "model-output")
    end

    # @param member [Vapi::ClientMessageSpeechUpdate]
    # @return [Vapi::ClientMessageMessage]
    def self.speech_update(member:)
      new(member: member, discriminant: "speech-update")
    end

    # @param member [Vapi::ClientMessageTranscript]
    # @return [Vapi::ClientMessageMessage]
    def self.transcript(member:)
      new(member: member, discriminant: "transcript")
    end

    # @param member [Vapi::ClientMessageToolCalls]
    # @return [Vapi::ClientMessageMessage]
    def self.tool_calls(member:)
      new(member: member, discriminant: "tool-calls")
    end

    # @param member [Vapi::ClientMessageToolCallsResult]
    # @return [Vapi::ClientMessageMessage]
    def self.tool_calls_result(member:)
      new(member: member, discriminant: "tool-calls-result")
    end

    # @param member [Vapi::ClientMessageUserInterrupted]
    # @return [Vapi::ClientMessageMessage]
    def self.user_interrupted(member:)
      new(member: member, discriminant: "user-interrupted")
    end

    # @param member [Vapi::ClientMessageLanguageChanged]
    # @return [Vapi::ClientMessageMessage]
    def self.language_changed(member:)
      new(member: member, discriminant: "language-changed")
    end

    # @param member [Vapi::ClientMessageVoiceInput]
    # @return [Vapi::ClientMessageMessage]
    def self.voice_input(member:)
      new(member: member, discriminant: "voice-input")
    end
  end
end
