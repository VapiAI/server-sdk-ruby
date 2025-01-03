# frozen_string_literal: true

require "json"
require_relative "make_tool_provider_details"
require_relative "ghl_tool_provider_details"
require_relative "function_tool_provider_details"

module Vapi
  class TemplateProviderDetails
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::TemplateProviderDetails]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of TemplateProviderDetails
    #
    # @param json_object [String]
    # @return [Vapi::TemplateProviderDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "make"
                 Vapi::MakeToolProviderDetails.from_json(json_object: json_object)
               when "ghl"
                 Vapi::GhlToolProviderDetails.from_json(json_object: json_object)
               when "function"
                 Vapi::FunctionToolProviderDetails.from_json(json_object: json_object)
               else
                 Vapi::MakeToolProviderDetails.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "make"
        { **@member.to_json, type: @discriminant }.to_json
      when "ghl"
        { **@member.to_json, type: @discriminant }.to_json
      when "function"
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
      when "make"
        Vapi::MakeToolProviderDetails.validate_raw(obj: obj)
      when "ghl"
        Vapi::GhlToolProviderDetails.validate_raw(obj: obj)
      when "function"
        Vapi::FunctionToolProviderDetails.validate_raw(obj: obj)
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

    # @param member [Vapi::MakeToolProviderDetails]
    # @return [Vapi::TemplateProviderDetails]
    def self.make(member:)
      new(member: member, discriminant: "make")
    end

    # @param member [Vapi::GhlToolProviderDetails]
    # @return [Vapi::TemplateProviderDetails]
    def self.ghl(member:)
      new(member: member, discriminant: "ghl")
    end

    # @param member [Vapi::FunctionToolProviderDetails]
    # @return [Vapi::TemplateProviderDetails]
    def self.function(member:)
      new(member: member, discriminant: "function")
    end
  end
end
