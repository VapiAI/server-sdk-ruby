# frozen_string_literal: true

require "json"
require_relative "say_hook_action"
require_relative "tool_call_hook_action"

module Vapi
  class CallHookCustomerSpeechInterruptedDoItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::CallHookCustomerSpeechInterruptedDoItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  CallHookCustomerSpeechInterruptedDoItem
    #
    # @param json_object [String]
    # @return [Vapi::CallHookCustomerSpeechInterruptedDoItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "say"
                 Vapi::SayHookAction.from_json(json_object: json_object)
               when "tool"
                 Vapi::ToolCallHookAction.from_json(json_object: json_object)
               else
                 Vapi::SayHookAction.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "say"
        { **@member.to_json, type: @discriminant }.to_json
      when "tool"
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
      when "say"
        Vapi::SayHookAction.validate_raw(obj: obj)
      when "tool"
        Vapi::ToolCallHookAction.validate_raw(obj: obj)
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

    # @param member [Vapi::SayHookAction]
    # @return [Vapi::CallHookCustomerSpeechInterruptedDoItem]
    def self.say(member:)
      new(member: member, discriminant: "say")
    end

    # @param member [Vapi::ToolCallHookAction]
    # @return [Vapi::CallHookCustomerSpeechInterruptedDoItem]
    def self.tool(member:)
      new(member: member, discriminant: "tool")
    end
  end
end
