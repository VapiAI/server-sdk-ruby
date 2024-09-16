# frozen_string_literal: true

require_relative "server_message_transfer_update_phone_number"
require_relative "server_message_transfer_update_destination"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require "ostruct"
require "json"

module Vapi
  class ServerMessageTransferUpdate
    # @return [Vapi::ServerMessageTransferUpdatePhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    attr_reader :phone_number
    # @return [Vapi::ServerMessageTransferUpdateDestination] This is the destination of the transfer.
    attr_reader :destination
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
    # @return [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred to. This is only sent
    #  if `destination.type` is "assistant".
    attr_reader :to_assistant
    # @return [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred from. This is only sent
    #  if `destination.type` is "assistant".
    attr_reader :from_assistant
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageTransferUpdatePhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    # @param destination [Vapi::ServerMessageTransferUpdateDestination] This is the destination of the transfer.
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
    # @param to_assistant [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred to. This is only sent
    #  if `destination.type` is "assistant".
    # @param from_assistant [Vapi::CreateAssistantDto] This is the assistant that the call is being transferred from. This is only sent
    #  if `destination.type` is "assistant".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageTransferUpdate]
    def initialize(phone_number: OMIT, destination: OMIT, timestamp: OMIT, artifact: OMIT, assistant: OMIT,
                   customer: OMIT, call: OMIT, to_assistant: OMIT, from_assistant: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @destination = destination if destination != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @to_assistant = to_assistant if to_assistant != OMIT
      @from_assistant = from_assistant if from_assistant != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "destination": destination,
        "timestamp": timestamp,
        "artifact": artifact,
        "assistant": assistant,
        "customer": customer,
        "call": call,
        "toAssistant": to_assistant,
        "fromAssistant": from_assistant
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ServerMessageTransferUpdate
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageTransferUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageTransferUpdatePhoneNumber.from_json(json_object: phone_number)
      end
      if parsed_json["destination"].nil?
        destination = nil
      else
        destination = parsed_json["destination"].to_json
        destination = Vapi::ServerMessageTransferUpdateDestination.from_json(json_object: destination)
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
      if parsed_json["toAssistant"].nil?
        to_assistant = nil
      else
        to_assistant = parsed_json["toAssistant"].to_json
        to_assistant = Vapi::CreateAssistantDto.from_json(json_object: to_assistant)
      end
      if parsed_json["fromAssistant"].nil?
        from_assistant = nil
      else
        from_assistant = parsed_json["fromAssistant"].to_json
        from_assistant = Vapi::CreateAssistantDto.from_json(json_object: from_assistant)
      end
      new(
        phone_number: phone_number,
        destination: destination,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        to_assistant: to_assistant,
        from_assistant: from_assistant,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessageTransferUpdate to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessageTransferUpdatePhoneNumber.validate_raw(obj: obj.phone_number)
      obj.destination.nil? || Vapi::ServerMessageTransferUpdateDestination.validate_raw(obj: obj.destination)
      obj.timestamp&.is_a?(String) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.to_assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.to_assistant)
      obj.from_assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.from_assistant)
    end
  end
end
