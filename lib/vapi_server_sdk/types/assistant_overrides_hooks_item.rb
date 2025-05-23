# frozen_string_literal: true

require "json"
require_relative "assistant_hook_call_ending"
require_relative "assistant_hook_assistant_speech_interrupted"
require_relative "assistant_hook_customer_speech_interrupted"

module Vapi
  class AssistantOverridesHooksItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::AssistantOverridesHooksItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of AssistantOverridesHooksItem
    #
    # @param json_object [String]
    # @return [Vapi::AssistantOverridesHooksItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.on
               when "call.ending"
                 Vapi::AssistantHookCallEnding.from_json(json_object: json_object)
               when "assistant.speech.interrupted"
                 Vapi::AssistantHookAssistantSpeechInterrupted.from_json(json_object: json_object)
               when "customer.speech.interrupted"
                 Vapi::AssistantHookCustomerSpeechInterrupted.from_json(json_object: json_object)
               else
                 Vapi::AssistantHookCallEnding.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.on)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "call.ending"
        { **@member.to_json, on: @discriminant }.to_json
      when "assistant.speech.interrupted"
        { **@member.to_json, on: @discriminant }.to_json
      when "customer.speech.interrupted"
        { **@member.to_json, on: @discriminant }.to_json
      else
        { "on": @discriminant, value: @member }.to_json
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
      case obj.on
      when "call.ending"
        Vapi::AssistantHookCallEnding.validate_raw(obj: obj)
      when "assistant.speech.interrupted"
        Vapi::AssistantHookAssistantSpeechInterrupted.validate_raw(obj: obj)
      when "customer.speech.interrupted"
        Vapi::AssistantHookCustomerSpeechInterrupted.validate_raw(obj: obj)
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

    # @param member [Vapi::AssistantHookCallEnding]
    # @return [Vapi::AssistantOverridesHooksItem]
    def self.call_ending(member:)
      new(member: member, discriminant: "call.ending")
    end

    # @param member [Vapi::AssistantHookAssistantSpeechInterrupted]
    # @return [Vapi::AssistantOverridesHooksItem]
    def self.assistant_speech_interrupted(member:)
      new(member: member, discriminant: "assistant.speech.interrupted")
    end

    # @param member [Vapi::AssistantHookCustomerSpeechInterrupted]
    # @return [Vapi::AssistantOverridesHooksItem]
    def self.customer_speech_interrupted(member:)
      new(member: member, discriminant: "customer.speech.interrupted")
    end
  end
end
