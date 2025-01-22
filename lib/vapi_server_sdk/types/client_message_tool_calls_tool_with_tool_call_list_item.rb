# frozen_string_literal: true

require "json"
require_relative "function_tool_with_tool_call"
require_relative "ghl_tool_with_tool_call"
require_relative "make_tool_with_tool_call"
require_relative "bash_tool_with_tool_call"
require_relative "computer_tool_with_tool_call"
require_relative "text_editor_tool_with_tool_call"

module Vapi
  class ClientMessageToolCallsToolWithToolCallListItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  ClientMessageToolCallsToolWithToolCallListItem
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "function"
                 Vapi::FunctionToolWithToolCall.from_json(json_object: json_object)
               when "ghl"
                 Vapi::GhlToolWithToolCall.from_json(json_object: json_object)
               when "make"
                 Vapi::MakeToolWithToolCall.from_json(json_object: json_object)
               when "bash"
                 Vapi::BashToolWithToolCall.from_json(json_object: json_object)
               when "computer"
                 Vapi::ComputerToolWithToolCall.from_json(json_object: json_object)
               when "textEditor"
                 Vapi::TextEditorToolWithToolCall.from_json(json_object: json_object)
               else
                 Vapi::FunctionToolWithToolCall.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "function"
        { **@member.to_json, type: @discriminant }.to_json
      when "ghl"
        { **@member.to_json, type: @discriminant }.to_json
      when "make"
        { **@member.to_json, type: @discriminant }.to_json
      when "bash"
        { **@member.to_json, type: @discriminant }.to_json
      when "computer"
        { **@member.to_json, type: @discriminant }.to_json
      when "textEditor"
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
      when "function"
        Vapi::FunctionToolWithToolCall.validate_raw(obj: obj)
      when "ghl"
        Vapi::GhlToolWithToolCall.validate_raw(obj: obj)
      when "make"
        Vapi::MakeToolWithToolCall.validate_raw(obj: obj)
      when "bash"
        Vapi::BashToolWithToolCall.validate_raw(obj: obj)
      when "computer"
        Vapi::ComputerToolWithToolCall.validate_raw(obj: obj)
      when "textEditor"
        Vapi::TextEditorToolWithToolCall.validate_raw(obj: obj)
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

    # @param member [Vapi::FunctionToolWithToolCall]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.function(member:)
      new(member: member, discriminant: "function")
    end

    # @param member [Vapi::GhlToolWithToolCall]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.ghl(member:)
      new(member: member, discriminant: "ghl")
    end

    # @param member [Vapi::MakeToolWithToolCall]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.make(member:)
      new(member: member, discriminant: "make")
    end

    # @param member [Vapi::BashToolWithToolCall]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.bash(member:)
      new(member: member, discriminant: "bash")
    end

    # @param member [Vapi::ComputerToolWithToolCall]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.computer(member:)
      new(member: member, discriminant: "computer")
    end

    # @param member [Vapi::TextEditorToolWithToolCall]
    # @return [Vapi::ClientMessageToolCallsToolWithToolCallListItem]
    def self.text_editor(member:)
      new(member: member, discriminant: "textEditor")
    end
  end
end
