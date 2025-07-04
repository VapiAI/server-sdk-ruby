# frozen_string_literal: true

require "json"
require_relative "transfer_destination_number"
require_relative "transfer_destination_sip"

module Vapi
  # This is the destination to transfer the inbound call to. This will immediately
  #  transfer without using any assistants.
  #  If this is sent, `assistantId`, `assistant`, `squadId`, and `squad` are ignored.
  class ServerMessageResponseAssistantRequestDestination
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ServerMessageResponseAssistantRequestDestination]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  ServerMessageResponseAssistantRequestDestination
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageResponseAssistantRequestDestination]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "number"
                 Vapi::TransferDestinationNumber.from_json(json_object: json_object)
               when "sip"
                 Vapi::TransferDestinationSip.from_json(json_object: json_object)
               else
                 Vapi::TransferDestinationNumber.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "number"
        { **@member.to_json, type: @discriminant }.to_json
      when "sip"
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
      when "number"
        Vapi::TransferDestinationNumber.validate_raw(obj: obj)
      when "sip"
        Vapi::TransferDestinationSip.validate_raw(obj: obj)
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

    # @param member [Vapi::TransferDestinationNumber]
    # @return [Vapi::ServerMessageResponseAssistantRequestDestination]
    def self.number(member:)
      new(member: member, discriminant: "number")
    end

    # @param member [Vapi::TransferDestinationSip]
    # @return [Vapi::ServerMessageResponseAssistantRequestDestination]
    def self.sip(member:)
      new(member: member, discriminant: "sip")
    end
  end
end
