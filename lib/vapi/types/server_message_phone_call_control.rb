# frozen_string_literal: true

require_relative "server_message_phone_call_control_phone_number"
require_relative "server_message_phone_call_control_request"
require_relative "server_message_phone_call_control_destination"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require "ostruct"
require "json"

module Vapi
  class ServerMessagePhoneCallControl
    # @return [Vapi::ServerMessagePhoneCallControlPhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    attr_reader :phone_number
    # @return [String] This is the type of the message. "phone-call-control" is an advanced type of
    #  message.
    #  When it is requested in `assistant.serverMessages`, the hangup and forwarding
    #  responsibilities are delegated to your server. Vapi will no longer do the actual
    #  transfer and hangup.
    attr_reader :type
    # @return [Vapi::ServerMessagePhoneCallControlRequest] This is the request to control the phone call.
    attr_reader :request
    # @return [Vapi::ServerMessagePhoneCallControlDestination] This is the destination to forward the call to if the request is "forward".
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
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessagePhoneCallControlPhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    # @param type [String] This is the type of the message. "phone-call-control" is an advanced type of
    #  message.
    #  When it is requested in `assistant.serverMessages`, the hangup and forwarding
    #  responsibilities are delegated to your server. Vapi will no longer do the actual
    #  transfer and hangup.
    # @param request [Vapi::ServerMessagePhoneCallControlRequest] This is the request to control the phone call.
    # @param destination [Vapi::ServerMessagePhoneCallControlDestination] This is the destination to forward the call to if the request is "forward".
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
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessagePhoneCallControl]
    def initialize(type:, request:, phone_number: OMIT, destination: OMIT, timestamp: OMIT, artifact: OMIT,
                   assistant: OMIT, customer: OMIT, call: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @request = request
      @destination = destination if destination != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "type": type,
        "request": request,
        "destination": destination,
        "timestamp": timestamp,
        "artifact": artifact,
        "assistant": assistant,
        "customer": customer,
        "call": call
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ServerMessagePhoneCallControl
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessagePhoneCallControl]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessagePhoneCallControlPhoneNumber.from_json(json_object: phone_number)
      end
      type = parsed_json["type"]
      request = parsed_json["request"]
      if parsed_json["destination"].nil?
        destination = nil
      else
        destination = parsed_json["destination"].to_json
        destination = Vapi::ServerMessagePhoneCallControlDestination.from_json(json_object: destination)
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
      new(
        phone_number: phone_number,
        type: type,
        request: request,
        destination: destination,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessagePhoneCallControl to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessagePhoneCallControlPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.request.is_a?(Vapi::ServerMessagePhoneCallControlRequest) != false || raise("Passed value for field obj.request is not the expected type, validation failed.")
      obj.destination.nil? || Vapi::ServerMessagePhoneCallControlDestination.validate_raw(obj: obj.destination)
      obj.timestamp&.is_a?(String) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
    end
  end
end
