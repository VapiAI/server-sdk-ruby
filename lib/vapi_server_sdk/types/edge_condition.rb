# frozen_string_literal: true
require "json"
require_relative "ai_edge_condition"
require_relative "logic_edge_condition"
require_relative "failed_edge_condition"

module Vapi
  class EdgeCondition
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::EdgeCondition]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of EdgeCondition
    #
    # @param json_object [String] 
    # @return [Vapi::EdgeCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "ai"
        member = Vapi::AiEdgeCondition.from_json(json_object: json_object)
      when "logic"
        member = Vapi::LogicEdgeCondition.from_json(json_object: json_object)
      when "failed"
        member = Vapi::FailedEdgeCondition.from_json(json_object: json_object)
      else
        member = Vapi::AiEdgeCondition.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "ai"
        { **@member.to_json, type: @discriminant }.to_json
      when "logic"
        { **@member.to_json, type: @discriminant }.to_json
      when "failed"
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
      when "ai"
        Vapi::AiEdgeCondition.validate_raw(obj: obj)
      when "logic"
        Vapi::LogicEdgeCondition.validate_raw(obj: obj)
      when "failed"
        Vapi::FailedEdgeCondition.validate_raw(obj: obj)
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
    # @param member [Vapi::AiEdgeCondition] 
    # @return [Vapi::EdgeCondition]
    def self.ai(member:)
      new(member: member, discriminant: "ai")
    end
    # @param member [Vapi::LogicEdgeCondition] 
    # @return [Vapi::EdgeCondition]
    def self.logic(member:)
      new(member: member, discriminant: "logic")
    end
    # @param member [Vapi::FailedEdgeCondition] 
    # @return [Vapi::EdgeCondition]
    def self.failed(member:)
      new(member: member, discriminant: "failed")
    end
  end
end