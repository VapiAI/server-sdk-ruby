# frozen_string_literal: true

require "json"
require_relative "handoff_step"
require_relative "callback_step"

module Vapi
  class WorkflowBlockStepsItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::WorkflowBlockStepsItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowBlockStepsItem
    #
    # @param json_object [String]
    # @return [Vapi::WorkflowBlockStepsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "handoff"
                 Vapi::HandoffStep.from_json(json_object: json_object)
               when "callback"
                 Vapi::CallbackStep.from_json(json_object: json_object)
               else
                 Vapi::HandoffStep.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "handoff"
        { **@member.to_json, type: @discriminant }.to_json
      when "callback"
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
      when "handoff"
        Vapi::HandoffStep.validate_raw(obj: obj)
      when "callback"
        Vapi::CallbackStep.validate_raw(obj: obj)
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

    # @param member [Vapi::HandoffStep]
    # @return [Vapi::WorkflowBlockStepsItem]
    def self.handoff(member:)
      new(member: member, discriminant: "handoff")
    end

    # @param member [Vapi::CallbackStep]
    # @return [Vapi::WorkflowBlockStepsItem]
    def self.callback(member:)
      new(member: member, discriminant: "callback")
    end
  end
end
