# frozen_string_literal: true

require "json"
require_relative "client_inbound_message_add_message"
require_relative "client_inbound_message_control"
require_relative "client_inbound_message_say"

module Vapi
  # These are the messages that can be sent from client-side SDKs to control the
  #  call.
  class ClientInboundMessageMessage
    # Deserialize a JSON object to an instance of ClientInboundMessageMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ClientInboundMessageAddMessage.validate_raw(obj: struct)
        return Vapi::ClientInboundMessageAddMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientInboundMessageControl.validate_raw(obj: struct)
        return Vapi::ClientInboundMessageControl.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ClientInboundMessageSay.validate_raw(obj: struct)
        return Vapi::ClientInboundMessageSay.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vapi::ClientInboundMessageAddMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientInboundMessageControl.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ClientInboundMessageSay.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
