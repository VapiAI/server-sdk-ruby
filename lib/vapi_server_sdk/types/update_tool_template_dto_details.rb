# frozen_string_literal: true
require "json"
require_relative "create_api_request_tool_dto"
require_relative "create_bash_tool_dto"
require_relative "create_computer_tool_dto"
require_relative "create_dtmf_tool_dto"
require_relative "create_end_call_tool_dto"
require_relative "create_function_tool_dto"
require_relative "create_go_high_level_calendar_availability_tool_dto"
require_relative "create_go_high_level_calendar_event_create_tool_dto"
require_relative "create_go_high_level_contact_create_tool_dto"
require_relative "create_go_high_level_contact_get_tool_dto"
require_relative "create_google_calendar_check_availability_tool_dto"
require_relative "create_google_calendar_create_event_tool_dto"
require_relative "create_google_sheets_row_append_tool_dto"
require_relative "create_mcp_tool_dto"
require_relative "create_query_tool_dto"
require_relative "create_slack_send_message_tool_dto"
require_relative "create_sms_tool_dto"
require_relative "create_text_editor_tool_dto"
require_relative "create_transfer_call_tool_dto"

module Vapi
  class UpdateToolTemplateDtoDetails
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of UpdateToolTemplateDtoDetails
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "apiRequest"
        member = Vapi::CreateApiRequestToolDto.from_json(json_object: json_object)
      when "bash"
        member = Vapi::CreateBashToolDto.from_json(json_object: json_object)
      when "computer"
        member = Vapi::CreateComputerToolDto.from_json(json_object: json_object)
      when "dtmf"
        member = Vapi::CreateDtmfToolDto.from_json(json_object: json_object)
      when "endCall"
        member = Vapi::CreateEndCallToolDto.from_json(json_object: json_object)
      when "function"
        member = Vapi::CreateFunctionToolDto.from_json(json_object: json_object)
      when "gohighlevel.calendar.availability.check"
        member = Vapi::CreateGoHighLevelCalendarAvailabilityToolDto.from_json(json_object: json_object)
      when "gohighlevel.calendar.event.create"
        member = Vapi::CreateGoHighLevelCalendarEventCreateToolDto.from_json(json_object: json_object)
      when "gohighlevel.contact.create"
        member = Vapi::CreateGoHighLevelContactCreateToolDto.from_json(json_object: json_object)
      when "gohighlevel.contact.get"
        member = Vapi::CreateGoHighLevelContactGetToolDto.from_json(json_object: json_object)
      when "google.calendar.availability.check"
        member = Vapi::CreateGoogleCalendarCheckAvailabilityToolDto.from_json(json_object: json_object)
      when "google.calendar.event.create"
        member = Vapi::CreateGoogleCalendarCreateEventToolDto.from_json(json_object: json_object)
      when "google.sheets.row.append"
        member = Vapi::CreateGoogleSheetsRowAppendToolDto.from_json(json_object: json_object)
      when "mcp"
        member = Vapi::CreateMcpToolDto.from_json(json_object: json_object)
      when "query"
        member = Vapi::CreateQueryToolDto.from_json(json_object: json_object)
      when "slack.message.send"
        member = Vapi::CreateSlackSendMessageToolDto.from_json(json_object: json_object)
      when "sms"
        member = Vapi::CreateSmsToolDto.from_json(json_object: json_object)
      when "textEditor"
        member = Vapi::CreateTextEditorToolDto.from_json(json_object: json_object)
      when "transferCall"
        member = Vapi::CreateTransferCallToolDto.from_json(json_object: json_object)
      else
        member = Vapi::CreateApiRequestToolDto.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "apiRequest"
        { **@member.to_json, type: @discriminant }.to_json
      when "bash"
        { **@member.to_json, type: @discriminant }.to_json
      when "computer"
        { **@member.to_json, type: @discriminant }.to_json
      when "dtmf"
        { **@member.to_json, type: @discriminant }.to_json
      when "endCall"
        { **@member.to_json, type: @discriminant }.to_json
      when "function"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.calendar.availability.check"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.calendar.event.create"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.contact.create"
        { **@member.to_json, type: @discriminant }.to_json
      when "gohighlevel.contact.get"
        { **@member.to_json, type: @discriminant }.to_json
      when "google.calendar.availability.check"
        { **@member.to_json, type: @discriminant }.to_json
      when "google.calendar.event.create"
        { **@member.to_json, type: @discriminant }.to_json
      when "google.sheets.row.append"
        { **@member.to_json, type: @discriminant }.to_json
      when "mcp"
        { **@member.to_json, type: @discriminant }.to_json
      when "query"
        { **@member.to_json, type: @discriminant }.to_json
      when "slack.message.send"
        { **@member.to_json, type: @discriminant }.to_json
      when "sms"
        { **@member.to_json, type: @discriminant }.to_json
      when "textEditor"
        { **@member.to_json, type: @discriminant }.to_json
      when "transferCall"
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
      when "apiRequest"
        Vapi::CreateApiRequestToolDto.validate_raw(obj: obj)
      when "bash"
        Vapi::CreateBashToolDto.validate_raw(obj: obj)
      when "computer"
        Vapi::CreateComputerToolDto.validate_raw(obj: obj)
      when "dtmf"
        Vapi::CreateDtmfToolDto.validate_raw(obj: obj)
      when "endCall"
        Vapi::CreateEndCallToolDto.validate_raw(obj: obj)
      when "function"
        Vapi::CreateFunctionToolDto.validate_raw(obj: obj)
      when "gohighlevel.calendar.availability.check"
        Vapi::CreateGoHighLevelCalendarAvailabilityToolDto.validate_raw(obj: obj)
      when "gohighlevel.calendar.event.create"
        Vapi::CreateGoHighLevelCalendarEventCreateToolDto.validate_raw(obj: obj)
      when "gohighlevel.contact.create"
        Vapi::CreateGoHighLevelContactCreateToolDto.validate_raw(obj: obj)
      when "gohighlevel.contact.get"
        Vapi::CreateGoHighLevelContactGetToolDto.validate_raw(obj: obj)
      when "google.calendar.availability.check"
        Vapi::CreateGoogleCalendarCheckAvailabilityToolDto.validate_raw(obj: obj)
      when "google.calendar.event.create"
        Vapi::CreateGoogleCalendarCreateEventToolDto.validate_raw(obj: obj)
      when "google.sheets.row.append"
        Vapi::CreateGoogleSheetsRowAppendToolDto.validate_raw(obj: obj)
      when "mcp"
        Vapi::CreateMcpToolDto.validate_raw(obj: obj)
      when "query"
        Vapi::CreateQueryToolDto.validate_raw(obj: obj)
      when "slack.message.send"
        Vapi::CreateSlackSendMessageToolDto.validate_raw(obj: obj)
      when "sms"
        Vapi::CreateSmsToolDto.validate_raw(obj: obj)
      when "textEditor"
        Vapi::CreateTextEditorToolDto.validate_raw(obj: obj)
      when "transferCall"
        Vapi::CreateTransferCallToolDto.validate_raw(obj: obj)
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
    # @param member [Vapi::CreateApiRequestToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.api_request(member:)
      new(member: member, discriminant: "apiRequest")
    end
    # @param member [Vapi::CreateBashToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.bash(member:)
      new(member: member, discriminant: "bash")
    end
    # @param member [Vapi::CreateComputerToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.computer(member:)
      new(member: member, discriminant: "computer")
    end
    # @param member [Vapi::CreateDtmfToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.dtmf(member:)
      new(member: member, discriminant: "dtmf")
    end
    # @param member [Vapi::CreateEndCallToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.end_call(member:)
      new(member: member, discriminant: "endCall")
    end
    # @param member [Vapi::CreateFunctionToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.function(member:)
      new(member: member, discriminant: "function")
    end
    # @param member [Vapi::CreateGoHighLevelCalendarAvailabilityToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.gohighlevel_calendar_availability_check(member:)
      new(member: member, discriminant: "gohighlevel.calendar.availability.check")
    end
    # @param member [Vapi::CreateGoHighLevelCalendarEventCreateToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.gohighlevel_calendar_event_create(member:)
      new(member: member, discriminant: "gohighlevel.calendar.event.create")
    end
    # @param member [Vapi::CreateGoHighLevelContactCreateToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.gohighlevel_contact_create(member:)
      new(member: member, discriminant: "gohighlevel.contact.create")
    end
    # @param member [Vapi::CreateGoHighLevelContactGetToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.gohighlevel_contact_get(member:)
      new(member: member, discriminant: "gohighlevel.contact.get")
    end
    # @param member [Vapi::CreateGoogleCalendarCheckAvailabilityToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.google_calendar_availability_check(member:)
      new(member: member, discriminant: "google.calendar.availability.check")
    end
    # @param member [Vapi::CreateGoogleCalendarCreateEventToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.google_calendar_event_create(member:)
      new(member: member, discriminant: "google.calendar.event.create")
    end
    # @param member [Vapi::CreateGoogleSheetsRowAppendToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.google_sheets_row_append(member:)
      new(member: member, discriminant: "google.sheets.row.append")
    end
    # @param member [Vapi::CreateMcpToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.mcp(member:)
      new(member: member, discriminant: "mcp")
    end
    # @param member [Vapi::CreateQueryToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.query(member:)
      new(member: member, discriminant: "query")
    end
    # @param member [Vapi::CreateSlackSendMessageToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.slack_message_send(member:)
      new(member: member, discriminant: "slack.message.send")
    end
    # @param member [Vapi::CreateSmsToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.sms(member:)
      new(member: member, discriminant: "sms")
    end
    # @param member [Vapi::CreateTextEditorToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.text_editor(member:)
      new(member: member, discriminant: "textEditor")
    end
    # @param member [Vapi::CreateTransferCallToolDto] 
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    def self.transfer_call(member:)
      new(member: member, discriminant: "transferCall")
    end
  end
end