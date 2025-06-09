# frozen_string_literal: true
require "json"
require_relative "make_tool_provider_details"
require_relative "ghl_tool_provider_details"
require_relative "function_tool_provider_details"
require_relative "google_calendar_create_event_tool_provider_details"
require_relative "google_sheets_row_append_tool_provider_details"
require_relative "go_high_level_calendar_availability_tool_provider_details"
require_relative "go_high_level_calendar_event_create_tool_provider_details"
require_relative "go_high_level_contact_create_tool_provider_details"
require_relative "go_high_level_contact_get_tool_provider_details"

module Vapi
  class CreateToolTemplateDtoProviderDetails
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of CreateToolTemplateDtoProviderDetails
    #
    # @param json_object [String] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "make"
        member = Vapi::MakeToolProviderDetails.from_json(json_object: json_object)
      when "ghl"
        member = Vapi::GhlToolProviderDetails.from_json(json_object: json_object)
      when "function"
        member = Vapi::FunctionToolProviderDetails.from_json(json_object: json_object)
      when "google.calendar.event.create"
        member = Vapi::GoogleCalendarCreateEventToolProviderDetails.from_json(json_object: json_object)
      when "google.sheets.row.append"
        member = Vapi::GoogleSheetsRowAppendToolProviderDetails.from_json(json_object: json_object)
      when "gohighlevel.calendar.availability.check"
        member = Vapi::GoHighLevelCalendarAvailabilityToolProviderDetails.from_json(json_object: json_object)
      when "gohighlevel.calendar.event.create"
        member = Vapi::GoHighLevelCalendarEventCreateToolProviderDetails.from_json(json_object: json_object)
      when "gohighlevel.contact.create"
        member = Vapi::GoHighLevelContactCreateToolProviderDetails.from_json(json_object: json_object)
      when "gohighlevel.contact.get"
        member = Vapi::GoHighLevelContactGetToolProviderDetails.from_json(json_object: json_object)
      else
        member = Vapi::MakeToolProviderDetails.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "make"
        { **@member.to_json, type: @discriminant }.to_json
      when "ghl"
        { **@member.to_json, type: @discriminant }.to_json
      when "function"
        { **@member.to_json, type: @discriminant }.to_json
      when "google.calendar.event.create"
        { **@member.to_json, type: @discriminant }.to_json
      when "google.sheets.row.append"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.calendar.availability.check"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.calendar.event.create"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.contact.create"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.contact.get"
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
      when "google.calendar.event.create"
        Vapi::GoogleCalendarCreateEventToolProviderDetails.validate_raw(obj: obj)
      when "google.sheets.row.append"
        Vapi::GoogleSheetsRowAppendToolProviderDetails.validate_raw(obj: obj)
      when "gohighlevel.calendar.availability.check"
        Vapi::GoHighLevelCalendarAvailabilityToolProviderDetails.validate_raw(obj: obj)
      when "gohighlevel.calendar.event.create"
        Vapi::GoHighLevelCalendarEventCreateToolProviderDetails.validate_raw(obj: obj)
      when "gohighlevel.contact.create"
        Vapi::GoHighLevelContactCreateToolProviderDetails.validate_raw(obj: obj)
      when "gohighlevel.contact.get"
        Vapi::GoHighLevelContactGetToolProviderDetails.validate_raw(obj: obj)
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
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.make(member:)
      new(member: member, discriminant: "make")
    end
    # @param member [Vapi::GhlToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.ghl(member:)
      new(member: member, discriminant: "ghl")
    end
    # @param member [Vapi::FunctionToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.function(member:)
      new(member: member, discriminant: "function")
    end
    # @param member [Vapi::GoogleCalendarCreateEventToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.google_calendar_event_create(member:)
      new(member: member, discriminant: "google.calendar.event.create")
    end
    # @param member [Vapi::GoogleSheetsRowAppendToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.google_sheets_row_append(member:)
      new(member: member, discriminant: "google.sheets.row.append")
    end
    # @param member [Vapi::GoHighLevelCalendarAvailabilityToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.gohighlevel_calendar_availability_check(member:)
      new(member: member, discriminant: "gohighlevel.calendar.availability.check")
    end
    # @param member [Vapi::GoHighLevelCalendarEventCreateToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.gohighlevel_calendar_event_create(member:)
      new(member: member, discriminant: "gohighlevel.calendar.event.create")
    end
    # @param member [Vapi::GoHighLevelContactCreateToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.gohighlevel_contact_create(member:)
      new(member: member, discriminant: "gohighlevel.contact.create")
    end
    # @param member [Vapi::GoHighLevelContactGetToolProviderDetails] 
    # @return [Vapi::CreateToolTemplateDtoProviderDetails]
    def self.gohighlevel_contact_get(member:)
      new(member: member, discriminant: "gohighlevel.contact.get")
    end
  end
end