# frozen_string_literal: true

require_relative "open_ai_message"
require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageAddMessage
    # @return [String] This is the type of the message. Send "add-message" message to add a message to
    #  the conversation history.
    attr_reader :type
    # @return [Vapi::OpenAiMessage] This is the message to add to the conversation.
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. Send "add-message" message to add a message to
    #  the conversation history.
    # @param message [Vapi::OpenAiMessage] This is the message to add to the conversation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageAddMessage]
    def initialize(type:, message:, additional_properties: nil)
      @type = type
      @message = message
      @additional_properties = additional_properties
      @_field_set = { "type": type, "message": message }
    end

    # Deserialize a JSON object to an instance of ClientInboundMessageAddMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageAddMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Vapi::OpenAiMessage.from_json(json_object: message)
      end
      new(
        type: type,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientInboundMessageAddMessage to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vapi::OpenAiMessage.validate_raw(obj: obj.message)
    end
  end
end
