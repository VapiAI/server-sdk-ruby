# frozen_string_literal: true

require "json"
require_relative "context_engineering_plan_last_n_messages"
require_relative "context_engineering_plan_none"
require_relative "context_engineering_plan_all"

module Vapi
  # This is the plan for manipulating the message context before handing off the
  #  call to the next assistant.
  class HandoffDestinationAssistantContextEngineeringPlan
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::HandoffDestinationAssistantContextEngineeringPlan]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  HandoffDestinationAssistantContextEngineeringPlan
    #
    # @param json_object [String]
    # @return [Vapi::HandoffDestinationAssistantContextEngineeringPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "lastNMessages"
                 Vapi::ContextEngineeringPlanLastNMessages.from_json(json_object: json_object)
               when "none"
                 Vapi::ContextEngineeringPlanNone.from_json(json_object: json_object)
               when "all"
                 Vapi::ContextEngineeringPlanAll.from_json(json_object: json_object)
               else
                 Vapi::ContextEngineeringPlanLastNMessages.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "lastNMessages"
        { **@member.to_json, type: @discriminant }.to_json
      when "none"
        { **@member.to_json, type: @discriminant }.to_json
      when "all"
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
      when "lastNMessages"
        Vapi::ContextEngineeringPlanLastNMessages.validate_raw(obj: obj)
      when "none"
        Vapi::ContextEngineeringPlanNone.validate_raw(obj: obj)
      when "all"
        Vapi::ContextEngineeringPlanAll.validate_raw(obj: obj)
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

    # @param member [Vapi::ContextEngineeringPlanLastNMessages]
    # @return [Vapi::HandoffDestinationAssistantContextEngineeringPlan]
    def self.last_n_messages(member:)
      new(member: member, discriminant: "lastNMessages")
    end

    # @param member [Vapi::ContextEngineeringPlanNone]
    # @return [Vapi::HandoffDestinationAssistantContextEngineeringPlan]
    def self.none(member:)
      new(member: member, discriminant: "none")
    end

    # @param member [Vapi::ContextEngineeringPlanAll]
    # @return [Vapi::HandoffDestinationAssistantContextEngineeringPlan]
    def self.all(member:)
      new(member: member, discriminant: "all")
    end
  end
end
