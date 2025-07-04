# frozen_string_literal: true

require_relative "server_message_status_update_phone_number"
require_relative "server_message_status_update_status"
require_relative "server_message_status_update_ended_reason"
require_relative "server_message_status_update_messages_item"
require_relative "open_ai_message"
require_relative "server_message_status_update_destination"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require_relative "chat"
require "ostruct"
require "json"

module Vapi
  class ServerMessageStatusUpdate
    # @return [Vapi::ServerMessageStatusUpdatePhoneNumber] This is the phone number that the message is associated with.
    attr_reader :phone_number
    # @return [Vapi::ServerMessageStatusUpdateStatus] This is the status of the call.
    attr_reader :status
    # @return [Vapi::ServerMessageStatusUpdateEndedReason] This is the reason the call ended. This is only sent if the status is "ended".
    attr_reader :ended_reason
    # @return [Array<Vapi::ServerMessageStatusUpdateMessagesItem>] These are the conversation messages of the call. This is only sent if the status
    #  is "forwarding".
    attr_reader :messages
    # @return [Array<Vapi::OpenAiMessage>] These are the conversation messages of the call. This is only sent if the status
    #  is "forwarding".
    attr_reader :messages_open_ai_formatted
    # @return [Vapi::ServerMessageStatusUpdateDestination] This is the destination the call is being transferred to. This is only sent if
    #  the status is "forwarding".
    attr_reader :destination
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
    # @return [Vapi::Chat] This is the chat object.
    attr_reader :chat
    # @return [String] This is the transcript of the call. This is only sent if the status is
    #  "forwarding".
    attr_reader :transcript
    # @return [String] This is the summary of the call. This is only sent if the status is
    #  "forwarding".
    attr_reader :summary
    # @return [Hash{String => Object}] This is the inbound phone call debugging artifacts. This is only sent if the
    #  status is "ended" and there was an error accepting the inbound phone call.
    #  This will include any errors related to the "assistant-request" if one was made.
    attr_reader :inbound_phone_call_debugging_artifacts
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageStatusUpdatePhoneNumber] This is the phone number that the message is associated with.
    # @param status [Vapi::ServerMessageStatusUpdateStatus] This is the status of the call.
    # @param ended_reason [Vapi::ServerMessageStatusUpdateEndedReason] This is the reason the call ended. This is only sent if the status is "ended".
    # @param messages [Array<Vapi::ServerMessageStatusUpdateMessagesItem>] These are the conversation messages of the call. This is only sent if the status
    #  is "forwarding".
    # @param messages_open_ai_formatted [Array<Vapi::OpenAiMessage>] These are the conversation messages of the call. This is only sent if the status
    #  is "forwarding".
    # @param destination [Vapi::ServerMessageStatusUpdateDestination] This is the destination the call is being transferred to. This is only sent if
    #  the status is "forwarding".
    # @param timestamp [Float] This is the timestamp of the message.
    # @param artifact [Vapi::Artifact] This is a live version of the `call.artifact`.
    #  This matches what is stored on `call.artifact` after the call.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that the message is associated with.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that the message is associated with.
    # @param call [Vapi::Call] This is the call that the message is associated with.
    # @param chat [Vapi::Chat] This is the chat object.
    # @param transcript [String] This is the transcript of the call. This is only sent if the status is
    #  "forwarding".
    # @param summary [String] This is the summary of the call. This is only sent if the status is
    #  "forwarding".
    # @param inbound_phone_call_debugging_artifacts [Hash{String => Object}] This is the inbound phone call debugging artifacts. This is only sent if the
    #  status is "ended" and there was an error accepting the inbound phone call.
    #  This will include any errors related to the "assistant-request" if one was made.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageStatusUpdate]
    def initialize(status:, phone_number: OMIT, ended_reason: OMIT, messages: OMIT, messages_open_ai_formatted: OMIT,
                   destination: OMIT, timestamp: OMIT, artifact: OMIT, assistant: OMIT, customer: OMIT, call: OMIT, chat: OMIT, transcript: OMIT, summary: OMIT, inbound_phone_call_debugging_artifacts: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @status = status
      @ended_reason = ended_reason if ended_reason != OMIT
      @messages = messages if messages != OMIT
      @messages_open_ai_formatted = messages_open_ai_formatted if messages_open_ai_formatted != OMIT
      @destination = destination if destination != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact if artifact != OMIT
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @chat = chat if chat != OMIT
      @transcript = transcript if transcript != OMIT
      @summary = summary if summary != OMIT
      if inbound_phone_call_debugging_artifacts != OMIT
        @inbound_phone_call_debugging_artifacts = inbound_phone_call_debugging_artifacts
      end
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "status": status,
        "endedReason": ended_reason,
        "messages": messages,
        "messagesOpenAIFormatted": messages_open_ai_formatted,
        "destination": destination,
        "timestamp": timestamp,
        "artifact": artifact,
        "assistant": assistant,
        "customer": customer,
        "call": call,
        "chat": chat,
        "transcript": transcript,
        "summary": summary,
        "inboundPhoneCallDebuggingArtifacts": inbound_phone_call_debugging_artifacts
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ServerMessageStatusUpdate
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageStatusUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageStatusUpdatePhoneNumber.from_json(json_object: phone_number)
      end
      status = parsed_json["status"]
      ended_reason = parsed_json["endedReason"]
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ServerMessageStatusUpdateMessagesItem.from_json(json_object: item)
      end
      messages_open_ai_formatted = parsed_json["messagesOpenAIFormatted"]&.map do |item|
        item = item.to_json
        Vapi::OpenAiMessage.from_json(json_object: item)
      end
      if parsed_json["destination"].nil?
        destination = nil
      else
        destination = parsed_json["destination"].to_json
        destination = Vapi::ServerMessageStatusUpdateDestination.from_json(json_object: destination)
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
      if parsed_json["chat"].nil?
        chat = nil
      else
        chat = parsed_json["chat"].to_json
        chat = Vapi::Chat.from_json(json_object: chat)
      end
      transcript = parsed_json["transcript"]
      summary = parsed_json["summary"]
      inbound_phone_call_debugging_artifacts = parsed_json["inboundPhoneCallDebuggingArtifacts"]
      new(
        phone_number: phone_number,
        status: status,
        ended_reason: ended_reason,
        messages: messages,
        messages_open_ai_formatted: messages_open_ai_formatted,
        destination: destination,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        chat: chat,
        transcript: transcript,
        summary: summary,
        inbound_phone_call_debugging_artifacts: inbound_phone_call_debugging_artifacts,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessageStatusUpdate to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessageStatusUpdatePhoneNumber.validate_raw(obj: obj.phone_number)
      obj.status.is_a?(Vapi::ServerMessageStatusUpdateStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.ended_reason&.is_a?(Vapi::ServerMessageStatusUpdateEndedReason) != false || raise("Passed value for field obj.ended_reason is not the expected type, validation failed.")
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.messages_open_ai_formatted&.is_a?(Array) != false || raise("Passed value for field obj.messages_open_ai_formatted is not the expected type, validation failed.")
      obj.destination.nil? || Vapi::ServerMessageStatusUpdateDestination.validate_raw(obj: obj.destination)
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      obj.chat.nil? || Vapi::Chat.validate_raw(obj: obj.chat)
      obj.transcript&.is_a?(String) != false || raise("Passed value for field obj.transcript is not the expected type, validation failed.")
      obj.summary&.is_a?(String) != false || raise("Passed value for field obj.summary is not the expected type, validation failed.")
      obj.inbound_phone_call_debugging_artifacts&.is_a?(Hash) != false || raise("Passed value for field obj.inbound_phone_call_debugging_artifacts is not the expected type, validation failed.")
    end
  end
end
