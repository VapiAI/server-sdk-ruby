# frozen_string_literal: true

require_relative "client_message_conversation_update_phone_number"
require_relative "client_message_conversation_update_messages_item"
require_relative "open_ai_message"
require_relative "call"
require_relative "create_customer_dto"
require_relative "create_assistant_dto"
require "ostruct"
require "json"

module Vapi
  class ClientMessageConversationUpdate
    # @return [Vapi::ClientMessageConversationUpdatePhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
    # @return [Array<Vapi::ClientMessageConversationUpdateMessagesItem>] This is the most up-to-date conversation history at the time the message is
    #  sent.
    attr_reader :messages
    # @return [Array<Vapi::OpenAiMessage>] This is the most up-to-date conversation history at the time the message is
    #  sent, formatted for OpenAI.
    attr_reader :messages_open_ai_formatted
    # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
    # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
    # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
    # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ClientMessageConversationUpdatePhoneNumber] This is the phone number that the message is associated with.
    # @param messages [Array<Vapi::ClientMessageConversationUpdateMessagesItem>] This is the most up-to-date conversation history at the time the message is
    #  sent.
    # @param messages_open_ai_formatted [Array<Vapi::OpenAiMessage>] This is the most up-to-date conversation history at the time the message is
    #  sent, formatted for OpenAI.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageConversationUpdate]
    def initialize(messages_open_ai_formatted:, phone_number: OMIT, messages: OMIT, timestamp: OMIT, call: OMIT,
                   customer: OMIT, assistant: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @messages = messages if messages != OMIT
      @messages_open_ai_formatted = messages_open_ai_formatted
      @timestamp = timestamp if timestamp != OMIT
      @call = call if call != OMIT
      @customer = customer if customer != OMIT
      @assistant = assistant if assistant != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "messages": messages,
        "messagesOpenAIFormatted": messages_open_ai_formatted,
        "timestamp": timestamp,
        "call": call,
        "customer": customer,
        "assistant": assistant
      }.reject do |_k, v|
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
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ClientMessageConversationUpdatePhoneNumber.from_json(json_object: phone_number)
      end
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ClientMessageConversationUpdateMessagesItem.from_json(json_object: item)
      end
      messages_open_ai_formatted = parsed_json["messagesOpenAIFormatted"]&.map do |item|
        item = item.to_json
        Vapi::OpenAiMessage.from_json(json_object: item)
      end
      timestamp = parsed_json["timestamp"]
      if parsed_json["call"].nil?
        call = nil
      else
        call = parsed_json["call"].to_json
        call = Vapi::Call.from_json(json_object: call)
      end
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      end
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      new(
        phone_number: phone_number,
        messages: messages,
        messages_open_ai_formatted: messages_open_ai_formatted,
        timestamp: timestamp,
        call: call,
        customer: customer,
        assistant: assistant,
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
      obj.phone_number.nil? || Vapi::ClientMessageConversationUpdatePhoneNumber.validate_raw(obj: obj.phone_number)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.messages_open_ai_formatted.is_a?(Array) != false || raise("Passed value for field obj.messages_open_ai_formatted is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
    end
  end
end
