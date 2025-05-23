# frozen_string_literal: true

require_relative "server_message_speech_update_phone_number"
require_relative "server_message_speech_update_status"
require_relative "server_message_speech_update_role"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require "ostruct"
require "json"

module Vapi
  class ServerMessageSpeechUpdate
    # @return [Vapi::ServerMessageSpeechUpdatePhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
    # @return [String] This is the type of the message. "speech-update" is sent whenever assistant or
    #  user start or stop speaking.
    attr_reader :type
    # @return [Vapi::ServerMessageSpeechUpdateStatus] This is the status of the speech update.
    attr_reader :status
    # @return [Vapi::ServerMessageSpeechUpdateRole] This is the role which the speech update is for.
    attr_reader :role
    # @return [Float] This is the turn number of the speech update (0-indexed).
    attr_reader :turn
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
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageSpeechUpdatePhoneNumber] This is the phone number that the message is associated with.
    # @param type [String] This is the type of the message. "speech-update" is sent whenever assistant or
    #  user start or stop speaking.
    # @param status [Vapi::ServerMessageSpeechUpdateStatus] This is the status of the speech update.
    # @param role [Vapi::ServerMessageSpeechUpdateRole] This is the role which the speech update is for.
    # @param turn [Float] This is the turn number of the speech update (0-indexed).
    # @param timestamp [Float] This is the timestamp of the message.
    # @param artifact [Vapi::Artifact] This is a live version of the `call.artifact`.
    #  This matches what is stored on `call.artifact` after the call.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageSpeechUpdate]
    def initialize(type:, status:, role:, phone_number: OMIT, turn: OMIT, timestamp: OMIT, artifact: OMIT,
                   assistant: OMIT, customer: OMIT, call: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @status = status
      @role = role
      @turn = turn if turn != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "type": type,
        "status": status,
        "role": role,
        "turn": turn,
        "timestamp": timestamp,
        "artifact": artifact,
        "assistant": assistant,
        "customer": customer,
        "call": call
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ServerMessageSpeechUpdate
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageSpeechUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageSpeechUpdatePhoneNumber.from_json(json_object: phone_number)
      end
      type = parsed_json["type"]
      status = parsed_json["status"]
      role = parsed_json["role"]
      turn = parsed_json["turn"]
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
        status: status,
        role: role,
        turn: turn,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessageSpeechUpdate to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessageSpeechUpdatePhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.status.is_a?(Vapi::ServerMessageSpeechUpdateStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::ServerMessageSpeechUpdateRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.turn&.is_a?(Float) != false || raise("Passed value for field obj.turn is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
    end
  end
end
