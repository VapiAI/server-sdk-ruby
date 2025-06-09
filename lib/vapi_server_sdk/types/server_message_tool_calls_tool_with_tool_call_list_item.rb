# frozen_string_literal: true
require "json"
require_relative "function_tool_with_tool_call"
require_relative "ghl_tool_with_tool_call"
require_relative "make_tool_with_tool_call"
require_relative "bash_tool_with_tool_call"
require_relative "computer_tool_with_tool_call"
require_relative "text_editor_tool_with_tool_call"
require_relative "google_calendar_create_event_tool_with_tool_call"

module Vapi
  class ServerMessageToolCallsToolWithToolCallListItem
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  ServerMessageToolCallsToolWithToolCallListItem
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "function"
        member = Vapi::FunctionToolWithToolCall.from_json(json_object: json_object)
      when "ghl"
        member = Vapi::GhlToolWithToolCall.from_json(json_object: json_object)
      when "make"
        member = Vapi::MakeToolWithToolCall.from_json(json_object: json_object)
      when "bash"
        member = Vapi::BashToolWithToolCall.from_json(json_object: json_object)
      when "computer"
        member = Vapi::ComputerToolWithToolCall.from_json(json_object: json_object)
      when "textEditor"
        member = Vapi::TextEditorToolWithToolCall.from_json(json_object: json_object)
      when "google.calendar.event.create"
        member = Vapi::GoogleCalendarCreateEventToolWithToolCall.from_json(json_object: json_object)
      else
        member = Vapi::FunctionToolWithToolCall.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
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
      when "google.calendar.event.create"
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
      when "google.calendar.event.create"
        Vapi::GoogleCalendarCreateEventToolWithToolCall.validate_raw(obj: obj)
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
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.function(member:)
      new(member: member, discriminant: "function")
    end
    # @param member [Vapi::GhlToolWithToolCall] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.ghl(member:)
      new(member: member, discriminant: "ghl")
    end
    # @param member [Vapi::MakeToolWithToolCall] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.make(member:)
      new(member: member, discriminant: "make")
    end
    # @param member [Vapi::BashToolWithToolCall] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.bash(member:)
      new(member: member, discriminant: "bash")
    end
    # @param member [Vapi::ComputerToolWithToolCall] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.computer(member:)
      new(member: member, discriminant: "computer")
    end
    # @param member [Vapi::TextEditorToolWithToolCall] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.text_editor(member:)
      new(member: member, discriminant: "textEditor")
    end
    # @param member [Vapi::GoogleCalendarCreateEventToolWithToolCall] 
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.google_calendar_event_create(member:)
      new(member: member, discriminant: "google.calendar.event.create")
    end
  end
end