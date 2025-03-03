# frozen_string_literal: true

require "json"
require_relative "say"
require_relative "gather"
require_relative "api_request"
require_relative "hangup"
require_relative "transfer"

module Vapi
  class WorkflowNodesItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::WorkflowNodesItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowNodesItem
    #
    # @param json_object [String]
    # @return [Vapi::WorkflowNodesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "say"
                 Vapi::Say.from_json(json_object: json_object)
               when "gather"
                 Vapi::Gather.from_json(json_object: json_object)
               when "apiRequest"
                 Vapi::ApiRequest.from_json(json_object: json_object)
               when "hangup"
                 Vapi::Hangup.from_json(json_object: json_object)
               when "transfer"
                 Vapi::Transfer.from_json(json_object: json_object)
               else
                 Vapi::Say.from_json(json_object: json_object)
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
      when "gather"
        { **@member.to_json, type: @discriminant }.to_json
      when "apiRequest"
        { **@member.to_json, type: @discriminant }.to_json
      when "hangup"
        { **@member.to_json, type: @discriminant }.to_json
      when "transfer"
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
        Vapi::Say.validate_raw(obj: obj)
      when "gather"
        Vapi::Gather.validate_raw(obj: obj)
      when "apiRequest"
        Vapi::ApiRequest.validate_raw(obj: obj)
      when "hangup"
        Vapi::Hangup.validate_raw(obj: obj)
      when "transfer"
        Vapi::Transfer.validate_raw(obj: obj)
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

    # @param member [Vapi::Say]
    # @return [Vapi::WorkflowNodesItem]
    def self.say(member:)
      new(member: member, discriminant: "say")
    end

    # @param member [Vapi::Gather]
    # @return [Vapi::WorkflowNodesItem]
    def self.gather(member:)
      new(member: member, discriminant: "gather")
    end

    # @param member [Vapi::ApiRequest]
    # @return [Vapi::WorkflowNodesItem]
    def self.api_request(member:)
      new(member: member, discriminant: "apiRequest")
    end

    # @param member [Vapi::Hangup]
    # @return [Vapi::WorkflowNodesItem]
    def self.hangup(member:)
      new(member: member, discriminant: "hangup")
    end

    # @param member [Vapi::Transfer]
    # @return [Vapi::WorkflowNodesItem]
    def self.transfer(member:)
      new(member: member, discriminant: "transfer")
    end
  end
end
