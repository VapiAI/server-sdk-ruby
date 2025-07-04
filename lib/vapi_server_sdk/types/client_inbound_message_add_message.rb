# frozen_string_literal: true

require_relative "open_ai_message"
require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageAddMessage
    # @return [Vapi::OpenAiMessage] This is the message to add to the conversation.
    attr_reader :message
    # @return [Boolean] This is the flag to trigger a response, or to insert the message into the
    #  conversation history silently. Defaults to `true`.
    #  Usage:
    #  - Use `true` to trigger a response.
    #  - Use `false` to insert the message into the conversation history silently.
    #  @default true
    attr_reader :trigger_response_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::OpenAiMessage] This is the message to add to the conversation.
    # @param trigger_response_enabled [Boolean] This is the flag to trigger a response, or to insert the message into the
    #  conversation history silently. Defaults to `true`.
    #  Usage:
    #  - Use `true` to trigger a response.
    #  - Use `false` to insert the message into the conversation history silently.
    #  @default true
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageAddMessage]
    def initialize(message:, trigger_response_enabled: OMIT, additional_properties: nil)
      @message = message
      @trigger_response_enabled = trigger_response_enabled if trigger_response_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "triggerResponseEnabled": trigger_response_enabled }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientInboundMessageAddMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageAddMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Vapi::OpenAiMessage.from_json(json_object: message)
      end
      trigger_response_enabled = parsed_json["triggerResponseEnabled"]
      new(
        message: message,
        trigger_response_enabled: trigger_response_enabled,
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
      Vapi::OpenAiMessage.validate_raw(obj: obj.message)
      obj.trigger_response_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.trigger_response_enabled is not the expected type, validation failed.")
    end
  end
end
