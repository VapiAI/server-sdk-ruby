# frozen_string_literal: true

require_relative "client_message_assistant_started_phone_number"
require_relative "client_message_assistant_started_type"
require_relative "call"
require_relative "create_customer_dto"
require_relative "create_assistant_dto"
require "ostruct"
require "json"

module Vapi
  class ClientMessageAssistantStarted
    # @return [Vapi::ClientMessageAssistantStartedPhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
    # @return [Vapi::ClientMessageAssistantStartedType] This is the type of the message. "assistant.started" is sent when the assistant
    #  is started.
    attr_reader :type
    # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
    # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
    # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
    # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
    # @return [Vapi::CreateAssistantDto] This is the assistant that was updated.
    attr_reader :new_assistant
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ClientMessageAssistantStartedPhoneNumber] This is the phone number that the message is associated with.
    # @param type [Vapi::ClientMessageAssistantStartedType] This is the type of the message. "assistant.started" is sent when the assistant
    #  is started.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param new_assistant [Vapi::CreateAssistantDto] This is the assistant that was updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageAssistantStarted]
    def initialize(type:, new_assistant:, phone_number: OMIT, timestamp: OMIT, call: OMIT, customer: OMIT,
                   assistant: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @timestamp = timestamp if timestamp != OMIT
      @call = call if call != OMIT
      @customer = customer if customer != OMIT
      @assistant = assistant if assistant != OMIT
      @new_assistant = new_assistant
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "type": type,
        "timestamp": timestamp,
        "call": call,
        "customer": customer,
        "assistant": assistant,
        "newAssistant": new_assistant
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientMessageAssistantStarted
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageAssistantStarted]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ClientMessageAssistantStartedPhoneNumber.from_json(json_object: phone_number)
      end
      type = parsed_json["type"]
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
      if parsed_json["newAssistant"].nil?
        new_assistant = nil
      else
        new_assistant = parsed_json["newAssistant"].to_json
        new_assistant = Vapi::CreateAssistantDto.from_json(json_object: new_assistant)
      end
      new(
        phone_number: phone_number,
        type: type,
        timestamp: timestamp,
        call: call,
        customer: customer,
        assistant: assistant,
        new_assistant: new_assistant,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageAssistantStarted to a JSON object
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
      obj.phone_number.nil? || Vapi::ClientMessageAssistantStartedPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(Vapi::ClientMessageAssistantStartedType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      Vapi::CreateAssistantDto.validate_raw(obj: obj.new_assistant)
    end
  end
end
