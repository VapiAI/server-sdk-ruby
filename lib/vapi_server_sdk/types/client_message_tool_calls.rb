# frozen_string_literal: true

require_relative "client_message_tool_calls_phone_number"
require_relative "client_message_tool_calls_type"
require_relative "client_message_tool_calls_tool_with_tool_call_list_item"
require_relative "call"
require_relative "create_customer_dto"
require_relative "create_assistant_dto"
require_relative "tool_call"
require "ostruct"
require "json"

module Vapi
  class ClientMessageToolCalls
    # @return [Vapi::ClientMessageToolCallsPhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
    # @return [Vapi::ClientMessageToolCallsType] This is the type of the message. "tool-calls" is sent to call a tool.
    attr_reader :type
    # @return [Array<Vapi::ClientMessageToolCallsToolWithToolCallListItem>] This is the list of tools calls that the model is requesting along with the
    #  original tool configuration.
    attr_reader :tool_with_tool_call_list
    # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
    # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
    # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
    # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
    # @return [Array<Vapi::ToolCall>] This is the list of tool calls that the model is requesting.
    attr_reader :tool_call_list
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ClientMessageToolCallsPhoneNumber] This is the phone number that the message is associated with.
    # @param type [Vapi::ClientMessageToolCallsType] This is the type of the message. "tool-calls" is sent to call a tool.
    # @param tool_with_tool_call_list [Array<Vapi::ClientMessageToolCallsToolWithToolCallListItem>] This is the list of tools calls that the model is requesting along with the
    #  original tool configuration.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param tool_call_list [Array<Vapi::ToolCall>] This is the list of tool calls that the model is requesting.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageToolCalls]
    def initialize(tool_with_tool_call_list:, tool_call_list:, phone_number: OMIT, type: OMIT, timestamp: OMIT, call: OMIT,
                   customer: OMIT, assistant: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type if type != OMIT
      @tool_with_tool_call_list = tool_with_tool_call_list
      @timestamp = timestamp if timestamp != OMIT
      @call = call if call != OMIT
      @customer = customer if customer != OMIT
      @assistant = assistant if assistant != OMIT
      @tool_call_list = tool_call_list
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "type": type,
        "toolWithToolCallList": tool_with_tool_call_list,
        "timestamp": timestamp,
        "call": call,
        "customer": customer,
        "assistant": assistant,
        "toolCallList": tool_call_list
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientMessageToolCalls
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageToolCalls]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ClientMessageToolCallsPhoneNumber.from_json(json_object: phone_number)
      end
      type = parsed_json["type"]
      tool_with_tool_call_list = parsed_json["toolWithToolCallList"]&.map do |item|
        item = item.to_json
        Vapi::ClientMessageToolCallsToolWithToolCallListItem.from_json(json_object: item)
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
      tool_call_list = parsed_json["toolCallList"]&.map do |item|
        item = item.to_json
        Vapi::ToolCall.from_json(json_object: item)
      end
      new(
        phone_number: phone_number,
        type: type,
        tool_with_tool_call_list: tool_with_tool_call_list,
        timestamp: timestamp,
        call: call,
        customer: customer,
        assistant: assistant,
        tool_call_list: tool_call_list,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageToolCalls to a JSON object
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
      obj.phone_number.nil? || Vapi::ClientMessageToolCallsPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type&.is_a?(Vapi::ClientMessageToolCallsType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.tool_with_tool_call_list.is_a?(Array) != false || raise("Passed value for field obj.tool_with_tool_call_list is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.tool_call_list.is_a?(Array) != false || raise("Passed value for field obj.tool_call_list is not the expected type, validation failed.")
    end
  end
end
