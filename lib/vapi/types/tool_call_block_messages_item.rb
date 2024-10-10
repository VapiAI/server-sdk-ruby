# frozen_string_literal: true

require "json"
require_relative "block_start_message"
require_relative "block_complete_message"

module Vapi
  class ToolCallBlockMessagesItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ToolCallBlockMessagesItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ToolCallBlockMessagesItem
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallBlockMessagesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "block-start"
                 Vapi::BlockStartMessage.from_json(json_object: json_object)
               when "block-complete"
                 Vapi::BlockCompleteMessage.from_json(json_object: json_object)
               else
                 Vapi::BlockStartMessage.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "block-start"
        { **@member.to_json, type: @discriminant }.to_json
      when "block-complete"
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
      when "block-start"
        Vapi::BlockStartMessage.validate_raw(obj: obj)
      when "block-complete"
        Vapi::BlockCompleteMessage.validate_raw(obj: obj)
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

    # @param member [Vapi::BlockStartMessage]
    # @return [Vapi::ToolCallBlockMessagesItem]
    def self.block_start(member:)
      new(member: member, discriminant: "block-start")
    end

    # @param member [Vapi::BlockCompleteMessage]
    # @return [Vapi::ToolCallBlockMessagesItem]
    def self.block_complete(member:)
      new(member: member, discriminant: "block-complete")
    end
  end
end
