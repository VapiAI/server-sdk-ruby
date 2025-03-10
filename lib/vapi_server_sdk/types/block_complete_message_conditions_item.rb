# frozen_string_literal: true

require "json"
require_relative "model_based_condition"
require_relative "rule_based_condition"

module Vapi
  class BlockCompleteMessageConditionsItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::BlockCompleteMessageConditionsItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of BlockCompleteMessageConditionsItem
    #
    # @param json_object [String]
    # @return [Vapi::BlockCompleteMessageConditionsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "model-based"
                 Vapi::ModelBasedCondition.from_json(json_object: json_object)
               when "rule-based"
                 Vapi::RuleBasedCondition.from_json(json_object: json_object)
               else
                 Vapi::ModelBasedCondition.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "model-based"
        { **@member.to_json, type: @discriminant }.to_json
      when "rule-based"
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
      when "model-based"
        Vapi::ModelBasedCondition.validate_raw(obj: obj)
      when "rule-based"
        Vapi::RuleBasedCondition.validate_raw(obj: obj)
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

    # @param member [Vapi::ModelBasedCondition]
    # @return [Vapi::BlockCompleteMessageConditionsItem]
    def self.model_based(member:)
      new(member: member, discriminant: "model-based")
    end

    # @param member [Vapi::RuleBasedCondition]
    # @return [Vapi::BlockCompleteMessageConditionsItem]
    def self.rule_based(member:)
      new(member: member, discriminant: "rule-based")
    end
  end
end
