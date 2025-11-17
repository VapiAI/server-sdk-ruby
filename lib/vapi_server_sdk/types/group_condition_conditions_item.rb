# frozen_string_literal: true

require "json"
require_relative "regex_condition"
require_relative "liquid_condition"
require_relative "group_condition"

module Vapi
  class GroupConditionConditionsItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::GroupConditionConditionsItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of GroupConditionConditionsItem
    #
    # @param json_object [String]
    # @return [Vapi::GroupConditionConditionsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "regex"
                 Vapi::RegexCondition.from_json(json_object: json_object)
               when "liquid"
                 Vapi::LiquidCondition.from_json(json_object: json_object)
               when "group"
                 Vapi::GroupCondition.from_json(json_object: json_object)
               else
                 Vapi::RegexCondition.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "regex"
        { **@member.to_json, type: @discriminant }.to_json
      when "liquid"
        { **@member.to_json, type: @discriminant }.to_json
      when "group"
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
      when "regex"
        Vapi::RegexCondition.validate_raw(obj: obj)
      when "liquid"
        Vapi::LiquidCondition.validate_raw(obj: obj)
      when "group"
        Vapi::GroupCondition.validate_raw(obj: obj)
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

    # @param member [Vapi::RegexCondition]
    # @return [Vapi::GroupConditionConditionsItem]
    def self.regex(member:)
      new(member: member, discriminant: "regex")
    end

    # @param member [Vapi::LiquidCondition]
    # @return [Vapi::GroupConditionConditionsItem]
    def self.liquid(member:)
      new(member: member, discriminant: "liquid")
    end

    # @param member [Vapi::GroupCondition]
    # @return [Vapi::GroupConditionConditionsItem]
    def self.group(member:)
      new(member: member, discriminant: "group")
    end
  end
end
