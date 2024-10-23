# frozen_string_literal: true

require_relative "client_message_conversation_update_messages_item"
require_relative "open_ai_message"
require "ostruct"
require "json"

module Vapi
  class ClientMessageConversationUpdate
    # @return [Array<Vapi::ClientMessageConversationUpdateMessagesItem>] This is the most up-to-date conversation history at the time the message is
    #  sent.
    attr_reader :messages
    # @return [Array<Vapi::OpenAiMessage>] This is the most up-to-date conversation history at the time the message is
    #  sent, formatted for OpenAI.
    attr_reader :messages_open_ai_formatted
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::ClientMessageConversationUpdateMessagesItem>] This is the most up-to-date conversation history at the time the message is
    #  sent.
    # @param messages_open_ai_formatted [Array<Vapi::OpenAiMessage>] This is the most up-to-date conversation history at the time the message is
    #  sent, formatted for OpenAI.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageConversationUpdate]
    def initialize(messages_open_ai_formatted:, messages: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @messages_open_ai_formatted = messages_open_ai_formatted
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "messagesOpenAIFormatted": messages_open_ai_formatted }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientMessageConversationUpdate
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageConversationUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ClientMessageConversationUpdateMessagesItem.from_json(json_object: item)
      end
      messages_open_ai_formatted = parsed_json["messagesOpenAIFormatted"]&.map do |item|
        item = item.to_json
        Vapi::OpenAiMessage.from_json(json_object: item)
      end
      new(
        messages: messages,
        messages_open_ai_formatted: messages_open_ai_formatted,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageConversationUpdate to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.messages_open_ai_formatted.is_a?(Array) != false || raise("Passed value for field obj.messages_open_ai_formatted is not the expected type, validation failed.")
    end
  end
end
