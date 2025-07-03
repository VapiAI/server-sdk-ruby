# frozen_string_literal: true
require "json"
require_relative "server_message_response_assistant_request"
require_relative "server_message_response_knowledge_base_request"
require_relative "server_message_response_tool_calls"
require_relative "server_message_response_transfer_destination_request"
require_relative "server_message_response_voice_request"
require_relative "server_message_response_call_endpointing_request"

module Vapi
# This is the response that is expected from the server to the message.
#  Note: Most messages don't expect a response. Only "assistant-request",
#  "tool-calls" and "transfer-destination-request" do.
  class ServerMessageResponseMessageResponse


# Deserialize a JSON object to an instance of ServerMessageResponseMessageResponse
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageResponseMessageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ServerMessageResponseAssistantRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::ServerMessageResponseAssistantRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageResponseKnowledgeBaseRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::ServerMessageResponseKnowledgeBaseRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageResponseToolCalls.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::ServerMessageResponseToolCalls.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageResponseTransferDestinationRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::ServerMessageResponseTransferDestinationRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageResponseVoiceRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::ServerMessageResponseVoiceRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::ServerMessageResponseCallEndpointingRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::ServerMessageResponseCallEndpointingRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vapi::ServerMessageResponseAssistantRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageResponseKnowledgeBaseRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageResponseToolCalls.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageResponseTransferDestinationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageResponseVoiceRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ServerMessageResponseCallEndpointingRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end