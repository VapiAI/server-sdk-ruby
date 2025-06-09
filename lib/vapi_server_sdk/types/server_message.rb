# frozen_string_literal: true
require_relative "server_message_message"
require "ostruct"
require "json"

module Vapi
  class ServerMessage
  # @return [Vapi::ServerMessageMessage] These are all the messages that can be sent to your server before, after and
#  during the call. Configure the messages you'd like to receive in
#  `assistant.serverMessages`.
#  The server where the message is sent is determined by the following precedence
#  order:
#  1. `tool.server.url` (if configured, and only for "tool-calls" message)
#  2. `assistant.serverUrl` (if configure)
#  3. `phoneNumber.serverUrl` (if configured)
#  4. `org.serverUrl` (if configured)
    attr_reader :message
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::ServerMessageMessage] These are all the messages that can be sent to your server before, after and
#  during the call. Configure the messages you'd like to receive in
#  `assistant.serverMessages`.
#  The server where the message is sent is determined by the following precedence
#  order:
#  1. `tool.server.url` (if configured, and only for "tool-calls" message)
#  2. `assistant.serverUrl` (if configure)
#  3. `phoneNumber.serverUrl` (if configured)
#  4. `org.serverUrl` (if configured)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessage]
    def initialize(message:, additional_properties: nil)
      @message = message
      @additional_properties = additional_properties
      @_field_set = { "message": message }
    end
# Deserialize a JSON object to an instance of ServerMessage
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["message"].nil?
        message = parsed_json["message"].to_json
        message = Vapi::ServerMessageMessage.from_json(json_object: message)
      else
        message = nil
      end
      new(message: message, additional_properties: struct)
    end
# Serialize an instance of ServerMessage to a JSON object
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
      Vapi::ServerMessageMessage.validate_raw(obj: obj.message)
    end
  end
end