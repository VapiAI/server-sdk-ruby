# frozen_string_literal: true

require_relative "client_message_message"
require "ostruct"
require "json"

module Vapi
  class ClientMessage
    # @return [Vapi::ClientMessageMessage] These are all the messages that can be sent to the client-side SDKs during the
    #  call. Configure the messages you'd like to receive in
    #  `assistant.clientMessages`.
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::ClientMessageMessage] These are all the messages that can be sent to the client-side SDKs during the
    #  call. Configure the messages you'd like to receive in
    #  `assistant.clientMessages`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessage]
    def initialize(message:, additional_properties: nil)
      @message = message
      @additional_properties = additional_properties
      @_field_set = { "message": message }
    end

    # Deserialize a JSON object to an instance of ClientMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Vapi::ClientMessageMessage.from_json(json_object: message)
      end
      new(message: message, additional_properties: struct)
    end

    # Serialize an instance of ClientMessage to a JSON object
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
      Vapi::ClientMessageMessage.validate_raw(obj: obj.message)
    end
  end
end