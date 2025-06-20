# frozen_string_literal: true
require_relative "server_message_transcript_phone_number"
require_relative "server_message_transcript_type"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require_relative "server_message_transcript_role"
require_relative "server_message_transcript_transcript_type"
require "ostruct"
require "json"

module Vapi
  class ServerMessageTranscript
  # @return [Vapi::ServerMessageTranscriptPhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
  # @return [Vapi::ServerMessageTranscriptType] This is the type of the message. "transcript" is sent as transcriber outputs
#  partial or final transcript.
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
  # @return [Vapi::ServerMessageTranscriptRole] This is the role for which the transcript is for.
    attr_reader :role
  # @return [Vapi::ServerMessageTranscriptTranscriptType] This is the type of the transcript.
    attr_reader :transcript_type
  # @return [String] This is the transcript content.
    attr_reader :transcript
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageTranscriptPhoneNumber] This is the phone number that the message is associated with.
    # @param type [Vapi::ServerMessageTranscriptType] This is the type of the message. "transcript" is sent as transcriber outputs
#  partial or final transcript.
    # @param timestamp [Float] This is the timestamp of the message.
    # @param artifact [Vapi::Artifact] This is a live version of the `call.artifact`.
#  This matches what is stored on `call.artifact` after the call.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param role [Vapi::ServerMessageTranscriptRole] This is the role for which the transcript is for.
    # @param transcript_type [Vapi::ServerMessageTranscriptTranscriptType] This is the type of the transcript.
    # @param transcript [String] This is the transcript content.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageTranscript]
    def initialize(phone_number: OMIT, type:, timestamp: OMIT, artifact: OMIT, assistant: OMIT, customer: OMIT, call: OMIT, role:, transcript_type:, transcript:, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @type = type
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @role = role
      @transcript_type = transcript_type
      @transcript = transcript
      @additional_properties = additional_properties
      @_field_set = { "phoneNumber": phone_number, "type": type, "timestamp": timestamp, "artifact": artifact, "assistant": assistant, "customer": customer, "call": call, "role": role, "transcriptType": transcript_type, "transcript": transcript }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ServerMessageTranscript
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageTranscript]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["phoneNumber"].nil?
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageTranscriptPhoneNumber.from_json(json_object: phone_number)
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
      role = parsed_json["role"]
      transcript_type = parsed_json["transcriptType"]
      transcript = parsed_json["transcript"]
      new(
        phone_number: phone_number,
        type: type,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        role: role,
        transcript_type: transcript_type,
        transcript: transcript,
        additional_properties: struct
      )
    end
# Serialize an instance of ServerMessageTranscript to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessageTranscriptPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.type.is_a?(Vapi::ServerMessageTranscriptType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.role.is_a?(Vapi::ServerMessageTranscriptRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.transcript_type.is_a?(Vapi::ServerMessageTranscriptTranscriptType) != false || raise("Passed value for field obj.transcript_type is not the expected type, validation failed.")
      obj.transcript.is_a?(String) != false || raise("Passed value for field obj.transcript is not the expected type, validation failed.")
    end
  end
end