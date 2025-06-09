# frozen_string_literal: true
require "json"
require_relative "tool_message_start"
require_relative "tool_message_complete"
require_relative "tool_message_failed"
require_relative "tool_message_delayed"

module Vapi
  class GoogleCalendarCreateEventToolMessagesItem
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::GoogleCalendarCreateEventToolMessagesItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  GoogleCalendarCreateEventToolMessagesItem
    #
    # @param json_object [String] 
    # @return [Vapi::GoogleCalendarCreateEventToolMessagesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "request-start"
        member = Vapi::ToolMessageStart.from_json(json_object: json_object)
      when "request-complete"
        member = Vapi::ToolMessageComplete.from_json(json_object: json_object)
      when "request-failed"
        member = Vapi::ToolMessageFailed.from_json(json_object: json_object)
      when "request-response-delayed"
        member = Vapi::ToolMessageDelayed.from_json(json_object: json_object)
      else
        member = Vapi::ToolMessageStart.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "request-start"
        { **@member.to_json, type: @discriminant }.to_json
      when "request-complete"
        { **@member.to_json, type: @discriminant }.to_json
      when "request-failed"
        { **@member.to_json, type: @discriminant }.to_json
      when "request-response-delayed"
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
      when "request-start"
        Vapi::ToolMessageStart.validate_raw(obj: obj)
      when "request-complete"
        Vapi::ToolMessageComplete.validate_raw(obj: obj)
      when "request-failed"
        Vapi::ToolMessageFailed.validate_raw(obj: obj)
      when "request-response-delayed"
        Vapi::ToolMessageDelayed.validate_raw(obj: obj)
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
    # @param member [Vapi::ToolMessageStart] 
    # @return [Vapi::GoogleCalendarCreateEventToolMessagesItem]
    def self.request_start(member:)
      new(member: member, discriminant: "request-start")
    end
    # @param member [Vapi::ToolMessageComplete] 
    # @return [Vapi::GoogleCalendarCreateEventToolMessagesItem]
    def self.request_complete(member:)
      new(member: member, discriminant: "request-complete")
    end
    # @param member [Vapi::ToolMessageFailed] 
    # @return [Vapi::GoogleCalendarCreateEventToolMessagesItem]
    def self.request_failed(member:)
      new(member: member, discriminant: "request-failed")
    end
    # @param member [Vapi::ToolMessageDelayed] 
    # @return [Vapi::GoogleCalendarCreateEventToolMessagesItem]
    def self.request_response_delayed(member:)
      new(member: member, discriminant: "request-response-delayed")
    end
  end
end