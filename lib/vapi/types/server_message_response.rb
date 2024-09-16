# frozen_string_literal: true

require_relative "server_message_response_message_response"
require "ostruct"
require "json"

module Vapi
  class ServerMessageResponse
    # @return [Vapi::ServerMessageResponseMessageResponse] This is the response that is expected from the server to the message.
    #  Note: Most messages don't expect a response. Only "assistant-request",
    #  "tool-calls" and "transfer-destination-request" do.
    attr_reader :message_response
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message_response [Vapi::ServerMessageResponseMessageResponse] This is the response that is expected from the server to the message.
    #  Note: Most messages don't expect a response. Only "assistant-request",
    #  "tool-calls" and "transfer-destination-request" do.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageResponse]
    def initialize(message_response:, additional_properties: nil)
      @message_response = message_response
      @additional_properties = additional_properties
      @_field_set = { "messageResponse": message_response }
    end

    # Deserialize a JSON object to an instance of ServerMessageResponse
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["messageResponse"].nil?
        message_response = nil
      else
        message_response = parsed_json["messageResponse"].to_json
        message_response = Vapi::ServerMessageResponseMessageResponse.from_json(json_object: message_response)
      end
      new(message_response: message_response, additional_properties: struct)
    end

    # Serialize an instance of ServerMessageResponse to a JSON object
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
      Vapi::ServerMessageResponseMessageResponse.validate_raw(obj: obj.message_response)
    end
  end
end
