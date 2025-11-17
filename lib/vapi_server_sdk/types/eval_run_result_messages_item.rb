# frozen_string_literal: true

require "json"
require_relative "chat_eval_user_message_mock"
require_relative "chat_eval_system_message_mock"
require_relative "chat_eval_tool_response_message_mock"
require_relative "chat_eval_assistant_message_mock"

module Vapi
  class EvalRunResultMessagesItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::EvalRunResultMessagesItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of EvalRunResultMessagesItem
    #
    # @param json_object [String]
    # @return [Vapi::EvalRunResultMessagesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.role
               when "user"
                 Vapi::ChatEvalUserMessageMock.from_json(json_object: json_object)
               when "system"
                 Vapi::ChatEvalSystemMessageMock.from_json(json_object: json_object)
               when "tool"
                 Vapi::ChatEvalToolResponseMessageMock.from_json(json_object: json_object)
               when "assistant"
                 Vapi::ChatEvalAssistantMessageMock.from_json(json_object: json_object)
               else
                 Vapi::ChatEvalUserMessageMock.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.role)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "user"
        { **@member.to_json, role: @discriminant }.to_json
      when "system"
        { **@member.to_json, role: @discriminant }.to_json
      when "tool"
        { **@member.to_json, role: @discriminant }.to_json
      when "assistant"
        { **@member.to_json, role: @discriminant }.to_json
      else
        { "role": @discriminant, value: @member }.to_json
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
      case obj.role
      when "user"
        Vapi::ChatEvalUserMessageMock.validate_raw(obj: obj)
      when "system"
        Vapi::ChatEvalSystemMessageMock.validate_raw(obj: obj)
      when "tool"
        Vapi::ChatEvalToolResponseMessageMock.validate_raw(obj: obj)
      when "assistant"
        Vapi::ChatEvalAssistantMessageMock.validate_raw(obj: obj)
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

    # @param member [Vapi::ChatEvalUserMessageMock]
    # @return [Vapi::EvalRunResultMessagesItem]
    def self.user(member:)
      new(member: member, discriminant: "user")
    end

    # @param member [Vapi::ChatEvalSystemMessageMock]
    # @return [Vapi::EvalRunResultMessagesItem]
    def self.system(member:)
      new(member: member, discriminant: "system")
    end

    # @param member [Vapi::ChatEvalToolResponseMessageMock]
    # @return [Vapi::EvalRunResultMessagesItem]
    def self.tool(member:)
      new(member: member, discriminant: "tool")
    end

    # @param member [Vapi::ChatEvalAssistantMessageMock]
    # @return [Vapi::EvalRunResultMessagesItem]
    def self.assistant(member:)
      new(member: member, discriminant: "assistant")
    end
  end
end
