# frozen_string_literal: true

require "json"
require_relative "tool_message_complete"
require_relative "tool_message_failed"

module Vapi
  class ToolCallResultMessageItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ToolCallResultMessageItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ToolCallResultMessageItem
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallResultMessageItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "request-complete"
                 Vapi::ToolMessageComplete.from_json(json_object: json_object)
               when "request-failed"
                 Vapi::ToolMessageFailed.from_json(json_object: json_object)
               else
                 Vapi::ToolMessageComplete.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "request-complete"
        { **@member.to_json, type: @discriminant }.to_json
      when "request-failed"
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
      when "request-complete"
        Vapi::ToolMessageComplete.validate_raw(obj: obj)
      when "request-failed"
        Vapi::ToolMessageFailed.validate_raw(obj: obj)
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

    # @param member [Vapi::ToolMessageComplete]
    # @return [Vapi::ToolCallResultMessageItem]
    def self.request_complete(member:)
      new(member: member, discriminant: "request-complete")
    end

    # @param member [Vapi::ToolMessageFailed]
    # @return [Vapi::ToolCallResultMessageItem]
    def self.request_failed(member:)
      new(member: member, discriminant: "request-failed")
    end
  end
end
