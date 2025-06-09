# frozen_string_literal: true
require_relative "client_message_workflow_node_started_phone_number"
require_relative "call"
require_relative "create_customer_dto"
require_relative "create_assistant_dto"
require "ostruct"
require "json"

module Vapi
  class ClientMessageWorkflowNodeStarted
  # @return [Vapi::ClientMessageWorkflowNodeStartedPhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
  # @return [String] This is the type of the message. "workflow.node.started" is sent when the active
#  node changes.
    attr_reader :type
  # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
  # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
  # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
  # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
  # @return [Hash{String => Object}] This is the active node.
    attr_reader :node
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ClientMessageWorkflowNodeStartedPhoneNumber] This is the phone number that the message is associated with.
    # @param type [String] This is the type of the message. "workflow.node.started" is sent when the active
#  node changes.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param node [Hash{String => Object}] This is the active node.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageWorkflowNodeStarted]
    def initialize(phone_number: OMIT, type:, timestamp: OMIT, call: OMIT, customer: OMIT, assistant: OMIT, node:, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @timestamp = timestamp if timestamp != OMIT
      @call = call if call != OMIT
      @customer = customer if customer != OMIT
      @assistant = assistant if assistant != OMIT
      @node = node
      @additional_properties = additional_properties
      @_field_set = { "phoneNumber": phone_number, "type": type, "timestamp": timestamp, "call": call, "customer": customer, "assistant": assistant, "node": node }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ClientMessageWorkflowNodeStarted
    #
    # @param json_object [String] 
    # @return [Vapi::ClientMessageWorkflowNodeStarted]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["phoneNumber"].nil?
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ClientMessageWorkflowNodeStartedPhoneNumber.from_json(json_object: phone_number)
      else
        phone_number = nil
      end
      type = parsed_json["type"]
      timestamp = parsed_json["timestamp"]
      unless parsed_json["call"].nil?
        call = parsed_json["call"].to_json
        call = Vapi::Call.from_json(json_object: call)
      else
        call = nil
      end
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      else
        customer = nil
      end
      unless parsed_json["assistant"].nil?
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      else
        assistant = nil
      end
      node = parsed_json["node"]
      new(
        phone_number: phone_number,
        type: type,
        timestamp: timestamp,
        call: call,
        customer: customer,
        assistant: assistant,
        node: node,
        additional_properties: struct
      )
    end
# Serialize an instance of ClientMessageWorkflowNodeStarted to a JSON object
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
      obj.phone_number.nil? || Vapi::ClientMessageWorkflowNodeStartedPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.node.is_a?(Hash) != false || raise("Passed value for field obj.node is not the expected type, validation failed.")
    end
  end
end