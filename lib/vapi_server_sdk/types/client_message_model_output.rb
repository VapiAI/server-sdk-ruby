# frozen_string_literal: true

require_relative "client_message_model_output_phone_number"
require_relative "call"
require_relative "create_customer_dto"
require_relative "create_assistant_dto"
require "ostruct"
require "json"

module Vapi
  class ClientMessageModelOutput
    # @return [Vapi::ClientMessageModelOutputPhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
    # @return [String] This is the type of the message. "model-output" is sent as the model outputs
    #  tokens.
    attr_reader :type
    # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
    # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
    # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
    # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
    # @return [Hash{String => Object}] This is the output of the model. It can be a token or tool call.
    attr_reader :output
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ClientMessageModelOutputPhoneNumber] This is the phone number that the message is associated with.
    # @param type [String] This is the type of the message. "model-output" is sent as the model outputs
    #  tokens.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param output [Hash{String => Object}] This is the output of the model. It can be a token or tool call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageModelOutput]
    def initialize(type:, output:, phone_number: OMIT, timestamp: OMIT, call: OMIT, customer: OMIT, assistant: OMIT,
                   additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @timestamp = timestamp if timestamp != OMIT
      @call = call if call != OMIT
      @customer = customer if customer != OMIT
      @assistant = assistant if assistant != OMIT
      @output = output
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "type": type,
        "timestamp": timestamp,
        "call": call,
        "customer": customer,
        "assistant": assistant,
        "output": output
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientMessageModelOutput
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageModelOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ClientMessageModelOutputPhoneNumber.from_json(json_object: phone_number)
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
      output = parsed_json["output"]
      new(
        phone_number: phone_number,
        type: type,
        timestamp: timestamp,
        call: call,
        customer: customer,
        assistant: assistant,
        output: output,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageModelOutput to a JSON object
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
      obj.phone_number.nil? || Vapi::ClientMessageModelOutputPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.output.is_a?(Hash) != false || raise("Passed value for field obj.output is not the expected type, validation failed.")
    end
  end
end
