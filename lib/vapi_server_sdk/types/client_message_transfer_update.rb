# frozen_string_literal: true
require_relative "client_message_transfer_update_phone_number"
require_relative "client_message_transfer_update_destination"
require_relative "call"
require_relative "create_customer_dto"
require_relative "create_assistant_dto"
require "ostruct"
require "json"

module Vapi
  class ClientMessageTransferUpdate
  # @return [Vapi::ClientMessageTransferUpdatePhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
  # @return [String] This is the type of the message. "transfer-update" is sent whenever a transfer
#  happens.
    attr_reader :type
  # @return [Vapi::ClientMessageTransferUpdateDestination] This is the destination of the transfer.
    attr_reader :destination
  # @return [Float] This is the timestamp of the message.
    attr_reader :timestamp
  # @return [Vapi::Call] This is the call that the message is associated with.
    attr_reader :call
  # @return [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    attr_reader :customer
  # @return [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    attr_reader :assistant
  # @return [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred to. This is only sent
#  if `destination.type` is "assistant".
    attr_reader :to_assistant
  # @return [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred from. This is only sent
#  if `destination.type` is "assistant".
    attr_reader :from_assistant
  # @return [Hash{String => Object}] This is the step that the conversation moved to.
    attr_reader :to_step_record
  # @return [Hash{String => Object}] This is the step that the conversation moved from. =
    attr_reader :from_step_record
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ClientMessageTransferUpdatePhoneNumber] This is the phone number that the message is associated with.
    # @param type [String] This is the type of the message. "transfer-update" is sent whenever a transfer
#  happens.
    # @param destination [Vapi::ClientMessageTransferUpdateDestination] This is the destination of the transfer.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param to_assistant [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred to. This is only sent
#  if `destination.type` is "assistant".
    # @param from_assistant [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred from. This is only sent
#  if `destination.type` is "assistant".
    # @param to_step_record [Hash{String => Object}] This is the step that the conversation moved to.
    # @param from_step_record [Hash{String => Object}] This is the step that the conversation moved from. =
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageTransferUpdate]
    def initialize(phone_number: OMIT, type:, destination: OMIT, timestamp: OMIT, call: OMIT, customer: OMIT, assistant: OMIT, to_assistant: OMIT, from_assistant: OMIT, to_step_record: OMIT, from_step_record: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @destination = destination if destination != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @call = call if call != OMIT
      @customer = customer if customer != OMIT
      @assistant = assistant if assistant != OMIT
      @to_assistant = to_assistant if to_assistant != OMIT
      @from_assistant = from_assistant if from_assistant != OMIT
      @to_step_record = to_step_record if to_step_record != OMIT
      @from_step_record = from_step_record if from_step_record != OMIT
      @additional_properties = additional_properties
      @_field_set = { "phoneNumber": phone_number, "type": type, "destination": destination, "timestamp": timestamp, "call": call, "customer": customer, "assistant": assistant, "toAssistant": to_assistant, "fromAssistant": from_assistant, "toStepRecord": to_step_record, "fromStepRecord": from_step_record }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ClientMessageTransferUpdate
    #
    # @param json_object [String] 
    # @return [Vapi::ClientMessageTransferUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["phoneNumber"].nil?
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ClientMessageTransferUpdatePhoneNumber.from_json(json_object: phone_number)
      else
        phone_number = nil
      end
      type = parsed_json["type"]
      unless parsed_json["destination"].nil?
        destination = parsed_json["destination"].to_json
        destination = Vapi::ClientMessageTransferUpdateDestination.from_json(json_object: destination)
      else
        destination = nil
      end
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
      unless parsed_json["toAssistant"].nil?
        to_assistant = parsed_json["toAssistant"].to_json
        to_assistant = Vapi::CreateAssistantDto.from_json(json_object: to_assistant)
      else
        to_assistant = nil
      end
      unless parsed_json["fromAssistant"].nil?
        from_assistant = parsed_json["fromAssistant"].to_json
        from_assistant = Vapi::CreateAssistantDto.from_json(json_object: from_assistant)
      else
        from_assistant = nil
      end
      to_step_record = parsed_json["toStepRecord"]
      from_step_record = parsed_json["fromStepRecord"]
      new(
        phone_number: phone_number,
        type: type,
        destination: destination,
        timestamp: timestamp,
        call: call,
        customer: customer,
        assistant: assistant,
        to_assistant: to_assistant,
        from_assistant: from_assistant,
        to_step_record: to_step_record,
        from_step_record: from_step_record,
        additional_properties: struct
      )
    end
# Serialize an instance of ClientMessageTransferUpdate to a JSON object
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
      obj.phone_number.nil? || Vapi::ClientMessageTransferUpdatePhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.destination.nil? || Vapi::ClientMessageTransferUpdateDestination.validate_raw(obj: obj.destination)
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.to_assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.to_assistant)
      obj.from_assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.from_assistant)
      obj.to_step_record&.is_a?(Hash) != false || raise("Passed value for field obj.to_step_record is not the expected type, validation failed.")
      obj.from_step_record&.is_a?(Hash) != false || raise("Passed value for field obj.from_step_record is not the expected type, validation failed.")
    end
  end
end