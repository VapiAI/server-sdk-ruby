# frozen_string_literal: true

require_relative "server_message_tool_calls_phone_number"
require_relative "server_message_tool_calls_tool_with_tool_call_list_item"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require_relative "tool_call"
require "ostruct"
require "json"

module Vapi
  class ServerMessageToolCalls
    # @return [Vapi::ServerMessageToolCallsPhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    attr_reader :phone_number
    # @return [Array<Vapi::ServerMessageToolCallsToolWithToolCallListItem>] This is the list of tools calls that the model is requesting along with the
    #  original tool configuration.
    attr_reader :tool_with_tool_call_list
    # @return [String] This is the ISO-8601 formatted timestamp of when the message was sent.
    attr_reader :timestamp
    # @return [Vapi::Artifact] This is a live version of the `call.artifact`.
    #  This matches what is stored on `call.artifact` after the call.
    attr_reader :artifact
    # @return [Vapi::CreateAssistantDto] This is the assistant that is currently active. This is provided for
    #  convenience.
    #  This matches one of the following:
    #  - `call.assistant`,
    #  - `call.assistantId`,
    #  - `call.squad[n].assistant`,
    #  - `call.squad[n].assistantId`,
    #  - `call.squadId->[n].assistant`,
    #  - `call.squadId->[n].assistantId`.
    attr_reader :assistant
    # @return [Vapi::CreateCustomerDto] This is the customer associated with the call.
    #  This matches one of the following:
    #  - `call.customer`,
    #  - `call.customerId`.
    attr_reader :customer
    # @return [Vapi::Call] This is the call object.
    #  This matches what was returned in POST /call.
    #  Note: This might get stale during the call. To get the latest call object,
    #  especially after the call is ended, use GET /call/:id.
    attr_reader :call
    # @return [Array<Vapi::ToolCall>] This is the list of tool calls that the model is requesting.
    attr_reader :tool_call_list
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageToolCallsPhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    # @param tool_with_tool_call_list [Array<Vapi::ServerMessageToolCallsToolWithToolCallListItem>] This is the list of tools calls that the model is requesting along with the
    #  original tool configuration.
    # @param timestamp [String] This is the ISO-8601 formatted timestamp of when the message was sent.
    # @param artifact [Vapi::Artifact] This is a live version of the `call.artifact`.
    #  This matches what is stored on `call.artifact` after the call.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that is currently active. This is provided for
    #  convenience.
    #  This matches one of the following:
    #  - `call.assistant`,
    #  - `call.assistantId`,
    #  - `call.squad[n].assistant`,
    #  - `call.squad[n].assistantId`,
    #  - `call.squadId->[n].assistant`,
    #  - `call.squadId->[n].assistantId`.
    # @param customer [Vapi::CreateCustomerDto] This is the customer associated with the call.
    #  This matches one of the following:
    #  - `call.customer`,
    #  - `call.customerId`.
    # @param call [Vapi::Call] This is the call object.
    #  This matches what was returned in POST /call.
    #  Note: This might get stale during the call. To get the latest call object,
    #  especially after the call is ended, use GET /call/:id.
    # @param tool_call_list [Array<Vapi::ToolCall>] This is the list of tool calls that the model is requesting.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageToolCalls]
    def initialize(tool_with_tool_call_list:, tool_call_list:, phone_number: OMIT, timestamp: OMIT, artifact: OMIT, assistant: OMIT,
                   customer: OMIT, call: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @tool_with_tool_call_list = tool_with_tool_call_list
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @tool_call_list = tool_call_list
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "toolWithToolCallList": tool_with_tool_call_list,
        "timestamp": timestamp,
        "artifact": artifact,
        "assistant": assistant,
        "customer": customer,
        "call": call,
        "toolCallList": tool_call_list
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ServerMessageToolCalls
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageToolCalls]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageToolCallsPhoneNumber.from_json(json_object: phone_number)
      end
      tool_with_tool_call_list = parsed_json["toolWithToolCallList"]&.map do |item|
        item = item.to_json
        Vapi::ServerMessageToolCallsToolWithToolCallListItem.from_json(json_object: item)
      end
      timestamp = parsed_json["timestamp"]
      if parsed_json["artifact"].nil?
        artifact = nil
      else
        artifact = parsed_json["artifact"].to_json
        artifact = Vapi::Artifact.from_json(json_object: artifact)
      end
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      end
      if parsed_json["call"].nil?
        call = nil
      else
        call = parsed_json["call"].to_json
        call = Vapi::Call.from_json(json_object: call)
      end
      tool_call_list = parsed_json["toolCallList"]&.map do |item|
        item = item.to_json
        Vapi::ToolCall.from_json(json_object: item)
      end
      new(
        phone_number: phone_number,
        tool_with_tool_call_list: tool_with_tool_call_list,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        tool_call_list: tool_call_list,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessageToolCalls to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessageToolCallsPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.tool_with_tool_call_list.is_a?(Array) != false || raise("Passed value for field obj.tool_with_tool_call_list is not the expected type, validation failed.")
      obj.timestamp&.is_a?(String) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.tool_call_list.is_a?(Array) != false || raise("Passed value for field obj.tool_call_list is not the expected type, validation failed.")
    end
  end
end
