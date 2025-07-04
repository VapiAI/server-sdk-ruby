# frozen_string_literal: true

require "json"
require_relative "client_inbound_message_add_message"
require_relative "client_inbound_message_control"
require_relative "client_inbound_message_say"
require_relative "client_inbound_message_end_call"
require_relative "client_inbound_message_transfer"

module Vapi
  # These are the messages that can be sent from client-side SDKs to control the
  #  call.
  class ClientInboundMessageMessage
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ClientInboundMessageMessage]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ClientInboundMessageMessage
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "add-message"
                 Vapi::ClientInboundMessageAddMessage.from_json(json_object: json_object)
               when "control"
                 Vapi::ClientInboundMessageControl.from_json(json_object: json_object)
               when "say"
                 Vapi::ClientInboundMessageSay.from_json(json_object: json_object)
               when "end-call"
                 Vapi::ClientInboundMessageEndCall.from_json(json_object: json_object)
               when "transfer"
                 Vapi::ClientInboundMessageTransfer.from_json(json_object: json_object)
               else
                 Vapi::ClientInboundMessageAddMessage.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "add-message"
        { **@member.to_json, type: @discriminant }.to_json
      when "control"
        { **@member.to_json, type: @discriminant }.to_json
      when "say"
        { **@member.to_json, type: @discriminant }.to_json
      when "end-call"
        { **@member.to_json, type: @discriminant }.to_json
      when "transfer"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "add-message"
        Vapi::ClientInboundMessageAddMessage.validate_raw(obj: obj)
      when "control"
        Vapi::ClientInboundMessageControl.validate_raw(obj: obj)
      when "say"
        Vapi::ClientInboundMessageSay.validate_raw(obj: obj)
      when "end-call"
        Vapi::ClientInboundMessageEndCall.validate_raw(obj: obj)
      when "transfer"
        Vapi::ClientInboundMessageTransfer.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::ClientInboundMessageAddMessage]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.add_message(member:)
      new(member: member, discriminant: "add-message")
    end

    # @param member [Vapi::ClientInboundMessageControl]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.control(member:)
      new(member: member, discriminant: "control")
    end

    # @param member [Vapi::ClientInboundMessageSay]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.say(member:)
      new(member: member, discriminant: "say")
    end

    # @param member [Vapi::ClientInboundMessageEndCall]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.end_call(member:)
      new(member: member, discriminant: "end-call")
    end

    # @param member [Vapi::ClientInboundMessageTransfer]
    # @return [Vapi::ClientInboundMessageMessage]
    def self.transfer(member:)
      new(member: member, discriminant: "transfer")
    end
  end
end
