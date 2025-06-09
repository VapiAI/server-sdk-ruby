# frozen_string_literal: true
require "json"
require_relative "assistant_custom_endpointing_rule"
require_relative "customer_custom_endpointing_rule"
require_relative "both_custom_endpointing_rule"

module Vapi
  class StartSpeakingPlanCustomEndpointingRulesItem
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::StartSpeakingPlanCustomEndpointingRulesItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  StartSpeakingPlanCustomEndpointingRulesItem
    #
    # @param json_object [String] 
    # @return [Vapi::StartSpeakingPlanCustomEndpointingRulesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "assistant"
        member = Vapi::AssistantCustomEndpointingRule.from_json(json_object: json_object)
      when "customer"
        member = Vapi::CustomerCustomEndpointingRule.from_json(json_object: json_object)
      when "both"
        member = Vapi::BothCustomEndpointingRule.from_json(json_object: json_object)
      else
        member = Vapi::AssistantCustomEndpointingRule.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "assistant"
        { **@member.to_json, type: @discriminant }.to_json
      when "customer"
        { **@member.to_json, type: @discriminant }.to_json
      when "both"
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
      when "assistant"
        Vapi::AssistantCustomEndpointingRule.validate_raw(obj: obj)
      when "customer"
        Vapi::CustomerCustomEndpointingRule.validate_raw(obj: obj)
      when "both"
        Vapi::BothCustomEndpointingRule.validate_raw(obj: obj)
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
    # @param member [Vapi::AssistantCustomEndpointingRule] 
    # @return [Vapi::StartSpeakingPlanCustomEndpointingRulesItem]
    def self.assistant(member:)
      new(member: member, discriminant: "assistant")
    end
    # @param member [Vapi::CustomerCustomEndpointingRule] 
    # @return [Vapi::StartSpeakingPlanCustomEndpointingRulesItem]
    def self.customer(member:)
      new(member: member, discriminant: "customer")
    end
    # @param member [Vapi::BothCustomEndpointingRule] 
    # @return [Vapi::StartSpeakingPlanCustomEndpointingRulesItem]
    def self.both(member:)
      new(member: member, discriminant: "both")
    end
  end
end