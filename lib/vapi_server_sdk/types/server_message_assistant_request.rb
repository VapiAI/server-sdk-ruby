# frozen_string_literal: true
require_relative "server_message_assistant_request_phone_number"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require_relative "chat"
require "ostruct"
require "json"

module Vapi
  class ServerMessageAssistantRequest
  # @return [Vapi::ServerMessageAssistantRequestPhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
  # @return [String] This is the type of the message. "assistant-request" is sent to fetch assistant
#  configuration for an incoming call.
    attr_reader :type
  # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
  # @return [Vapi::Artifact] This is a live version of the `call.artifact`.
#  This matches what is stored on `call.artifact` after the call.
    attr_reader :artifact
  # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
  # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
  # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
  # @return [Vapi::Chat] This is the chat object.
    attr_reader :chat
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageAssistantRequestPhoneNumber] This is the phone number that the message is associated with.
    # @param type [String] This is the type of the message. "assistant-request" is sent to fetch assistant
#  configuration for an incoming call.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param artifact [Vapi::Artifact] This is a live version of the `call.artifact`.
#  This matches what is stored on `call.artifact` after the call.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param chat [Vapi::Chat] This is the chat object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageAssistantRequest]
    def initialize(phone_number: OMIT, type:, timestamp: OMIT, artifact: OMIT, assistant: OMIT, customer: OMIT, call: OMIT, chat: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @chat = chat if chat != OMIT
      @additional_properties = additional_properties
      @_field_set = { "phoneNumber": phone_number, "type": type, "timestamp": timestamp, "artifact": artifact, "assistant": assistant, "customer": customer, "call": call, "chat": chat }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ServerMessageAssistantRequest
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageAssistantRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["phoneNumber"].nil?
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageAssistantRequestPhoneNumber.from_json(json_object: phone_number)
      else
        phone_number = nil
      end
      type = parsed_json["type"]
      timestamp = parsed_json["timestamp"]
      unless parsed_json["artifact"].nil?
        artifact = parsed_json["artifact"].to_json
        artifact = Vapi::Artifact.from_json(json_object: artifact)
      else
        artifact = nil
      end
      unless parsed_json["assistant"].nil?
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      else
        assistant = nil
      end
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      else
        customer = nil
      end
      unless parsed_json["call"].nil?
        call = parsed_json["call"].to_json
        call = Vapi::Call.from_json(json_object: call)
      else
        call = nil
      end
      unless parsed_json["chat"].nil?
        chat = parsed_json["chat"].to_json
        chat = Vapi::Chat.from_json(json_object: chat)
      else
        chat = nil
      end
      new(
        phone_number: phone_number,
        type: type,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        chat: chat,
        additional_properties: struct
      )
    end
# Serialize an instance of ServerMessageAssistantRequest to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.phone_number.nil? || Vapi::ServerMessageAssistantRequestPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.chat.nil? || Vapi::Chat.validate_raw(obj: obj.chat)
    end
  end
end