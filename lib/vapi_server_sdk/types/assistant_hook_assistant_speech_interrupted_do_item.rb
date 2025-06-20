# frozen_string_literal: true
require "json"
require_relative "transfer_assistant_hook_action"
require_relative "function_call_assistant_hook_action"
require_relative "say_assistant_hook_action"

module Vapi
  class AssistantHookAssistantSpeechInterruptedDoItem
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::AssistantHookAssistantSpeechInterruptedDoItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  AssistantHookAssistantSpeechInterruptedDoItem
    #
    # @param json_object [String] 
    # @return [Vapi::AssistantHookAssistantSpeechInterruptedDoItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "transfer"
        member = Vapi::TransferAssistantHookAction.from_json(json_object: json_object)
      when "function"
        member = Vapi::FunctionCallAssistantHookAction.from_json(json_object: json_object)
      when "say"
        member = Vapi::SayAssistantHookAction.from_json(json_object: json_object)
      else
        member = Vapi::TransferAssistantHookAction.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "transfer"
        { **@member.to_json, type: @discriminant }.to_json
      when "function"
        { **@member.to_json, type: @discriminant }.to_json
      when "say"
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
      when "transfer"
        Vapi::TransferAssistantHookAction.validate_raw(obj: obj)
      when "function"
        Vapi::FunctionCallAssistantHookAction.validate_raw(obj: obj)
      when "say"
        Vapi::SayAssistantHookAction.validate_raw(obj: obj)
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
    # @param member [Vapi::TransferAssistantHookAction] 
    # @return [Vapi::AssistantHookAssistantSpeechInterruptedDoItem]
    def self.transfer(member:)
      new(member: member, discriminant: "transfer")
    end
    # @param member [Vapi::FunctionCallAssistantHookAction] 
    # @return [Vapi::AssistantHookAssistantSpeechInterruptedDoItem]
    def self.function(member:)
      new(member: member, discriminant: "function")
    end
    # @param member [Vapi::SayAssistantHookAction] 
    # @return [Vapi::AssistantHookAssistantSpeechInterruptedDoItem]
    def self.say(member:)
      new(member: member, discriminant: "say")
    end
  end
end