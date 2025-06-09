# frozen_string_literal: true
require "json"
require_relative "../../types/dtmf_tool"
require_relative "../../types/end_call_tool"
require_relative "../../types/function_tool"
require_relative "../../types/ghl_tool"
require_relative "../../types/make_tool"
require_relative "../../types/transfer_call_tool"
require_relative "../../types/output_tool"
require_relative "../../types/bash_tool"
require_relative "../../types/computer_tool"
require_relative "../../types/text_editor_tool"
require_relative "../../types/query_tool"
require_relative "../../types/google_calendar_create_event_tool"
require_relative "../../types/google_sheets_row_append_tool"
require_relative "../../types/google_calendar_check_availability_tool"
require_relative "../../types/slack_send_message_tool"
require_relative "../../types/sms_tool"
require_relative "../../types/mcp_tool"
require_relative "../../types/go_high_level_calendar_availability_tool"
require_relative "../../types/go_high_level_calendar_event_create_tool"
require_relative "../../types/go_high_level_contact_create_tool"
require_relative "../../types/go_high_level_contact_get_tool"

module Vapi
  module Tools
    class ToolsListResponseItem
    # @return [Object] 
      attr_reader :member
    # @return [String] 
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object] 
      # @param discriminant [String] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end
# Deserialize a JSON object to an instance of ToolsListResponseItem
      #
      # @param json_object [String] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        case struct.type
        when "dtmf"
          member = Vapi::DtmfTool.from_json(json_object: json_object)
        when "endCall"
          member = Vapi::EndCallTool.from_json(json_object: json_object)
        when "function"
          member = Vapi::FunctionTool.from_json(json_object: json_object)
        when "ghl"
          member = Vapi::GhlTool.from_json(json_object: json_object)
        when "make"
          member = Vapi::MakeTool.from_json(json_object: json_object)
        when "transferCall"
          member = Vapi::TransferCallTool.from_json(json_object: json_object)
        when "output"
          member = Vapi::OutputTool.from_json(json_object: json_object)
        when "bash"
          member = Vapi::BashTool.from_json(json_object: json_object)
        when "computer"
          member = Vapi::ComputerTool.from_json(json_object: json_object)
        when "textEditor"
          member = Vapi::TextEditorTool.from_json(json_object: json_object)
        when "query"
          member = Vapi::QueryTool.from_json(json_object: json_object)
        when "google.calendar.event.create"
          member = Vapi::GoogleCalendarCreateEventTool.from_json(json_object: json_object)
        when "google.sheets.row.append"
          member = Vapi::GoogleSheetsRowAppendTool.from_json(json_object: json_object)
        when "google.calendar.availability.check"
          member = Vapi::GoogleCalendarCheckAvailabilityTool.from_json(json_object: json_object)
        when "slack.message.send"
          member = Vapi::SlackSendMessageTool.from_json(json_object: json_object)
        when "sms"
          member = Vapi::SmsTool.from_json(json_object: json_object)
        when "mcp"
          member = Vapi::McpTool.from_json(json_object: json_object)
        when "gohighlevel.calendar.availability.check"
          member = Vapi::GoHighLevelCalendarAvailabilityTool.from_json(json_object: json_object)
        when "gohighlevel.calendar.event.create"
          member = Vapi::GoHighLevelCalendarEventCreateTool.from_json(json_object: json_object)
        when "gohighlevel.contact.create"
          member = Vapi::GoHighLevelContactCreateTool.from_json(json_object: json_object)
        when "gohighlevel.contact.get"
          member = Vapi::GoHighLevelContactGetTool.from_json(json_object: json_object)
        else
          member = Vapi::DtmfTool.from_json(json_object: json_object)
        end
        new(member: member, discriminant: struct.type)
      end
# For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json
        case @discriminant
        when "dtmf"
          { **@member.to_json, type: @discriminant }.to_json
        when "endCall"
          { **@member.to_json, type: @discriminant }.to_json
        when "function"
          { **@member.to_json, type: @discriminant }.to_json
        when "ghl"
          { **@member.to_json, type: @discriminant }.to_json
        when "make"
          { **@member.to_json, type: @discriminant }.to_json
        when "transferCall"
          { **@member.to_json, type: @discriminant }.to_json
        when "output"
          { **@member.to_json, type: @discriminant }.to_json
        when "bash"
          { **@member.to_json, type: @discriminant }.to_json
        when "computer"
          { **@member.to_json, type: @discriminant }.to_json
        when "textEditor"
          { **@member.to_json, type: @discriminant }.to_json
        when "query"
          { **@member.to_json, type: @discriminant }.to_json
        when "google.calendar.event.create"
          { **@member.to_json, type: @discriminant }.to_json
        when "google.sheets.row.append"
          { **@member.to_json, type: @discriminant }.to_json
        when "google.calendar.availability.check"
          { **@member.to_json, type: @discriminant }.to_json
        when "slack.message.send"
          { **@member.to_json, type: @discriminant }.to_json
        when "sms"
          { **@member.to_json, type: @discriminant }.to_json
        when "mcp"
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
        when "dtmf"
          Vapi::DtmfTool.validate_raw(obj: obj)
        when "endCall"
          Vapi::EndCallTool.validate_raw(obj: obj)
        when "function"
          Vapi::FunctionTool.validate_raw(obj: obj)
        when "ghl"
          Vapi::GhlTool.validate_raw(obj: obj)
        when "make"
          Vapi::MakeTool.validate_raw(obj: obj)
        when "transferCall"
          Vapi::TransferCallTool.validate_raw(obj: obj)
        when "output"
          Vapi::OutputTool.validate_raw(obj: obj)
        when "bash"
          Vapi::BashTool.validate_raw(obj: obj)
        when "computer"
          Vapi::ComputerTool.validate_raw(obj: obj)
        when "textEditor"
          Vapi::TextEditorTool.validate_raw(obj: obj)
        when "query"
          Vapi::QueryTool.validate_raw(obj: obj)
        when "google.calendar.event.create"
          Vapi::GoogleCalendarCreateEventTool.validate_raw(obj: obj)
        when "google.sheets.row.append"
          Vapi::GoogleSheetsRowAppendTool.validate_raw(obj: obj)
        when "google.calendar.availability.check"
          Vapi::GoogleCalendarCheckAvailabilityTool.validate_raw(obj: obj)
        when "slack.message.send"
          Vapi::SlackSendMessageTool.validate_raw(obj: obj)
        when "sms"
          Vapi::SmsTool.validate_raw(obj: obj)
        when "mcp"
          Vapi::McpTool.validate_raw(obj: obj)
        when "gohighlevel.calendar.availability.check"
          Vapi::GoHighLevelCalendarAvailabilityTool.validate_raw(obj: obj)
        when "gohighlevel.calendar.event.create"
          Vapi::GoHighLevelCalendarEventCreateTool.validate_raw(obj: obj)
        when "gohighlevel.contact.create"
          Vapi::GoHighLevelContactCreateTool.validate_raw(obj: obj)
        when "gohighlevel.contact.get"
          Vapi::GoHighLevelContactGetTool.validate_raw(obj: obj)
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
      # @param member [Vapi::DtmfTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.dtmf(member:)
        new(member: member, discriminant: "dtmf")
      end
      # @param member [Vapi::EndCallTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.end_call(member:)
        new(member: member, discriminant: "endCall")
      end
      # @param member [Vapi::FunctionTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.function(member:)
        new(member: member, discriminant: "function")
      end
      # @param member [Vapi::GhlTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.ghl(member:)
        new(member: member, discriminant: "ghl")
      end
      # @param member [Vapi::MakeTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.make(member:)
        new(member: member, discriminant: "make")
      end
      # @param member [Vapi::TransferCallTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.transfer_call(member:)
        new(member: member, discriminant: "transferCall")
      end
      # @param member [Vapi::OutputTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.output(member:)
        new(member: member, discriminant: "output")
      end
      # @param member [Vapi::BashTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.bash(member:)
        new(member: member, discriminant: "bash")
      end
      # @param member [Vapi::ComputerTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.computer(member:)
        new(member: member, discriminant: "computer")
      end
      # @param member [Vapi::TextEditorTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.text_editor(member:)
        new(member: member, discriminant: "textEditor")
      end
      # @param member [Vapi::QueryTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.query(member:)
        new(member: member, discriminant: "query")
      end
      # @param member [Vapi::GoogleCalendarCreateEventTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.google_calendar_event_create(member:)
        new(member: member, discriminant: "google.calendar.event.create")
      end
      # @param member [Vapi::GoogleSheetsRowAppendTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.google_sheets_row_append(member:)
        new(member: member, discriminant: "google.sheets.row.append")
      end
      # @param member [Vapi::GoogleCalendarCheckAvailabilityTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.google_calendar_availability_check(member:)
        new(member: member, discriminant: "google.calendar.availability.check")
      end
      # @param member [Vapi::SlackSendMessageTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.slack_message_send(member:)
        new(member: member, discriminant: "slack.message.send")
      end
      # @param member [Vapi::SmsTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.sms(member:)
        new(member: member, discriminant: "sms")
      end
      # @param member [Vapi::McpTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.mcp(member:)
        new(member: member, discriminant: "mcp")
      end
      # @param member [Vapi::GoHighLevelCalendarAvailabilityTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.gohighlevel_calendar_availability_check(member:)
        new(member: member, discriminant: "gohighlevel.calendar.availability.check")
      end
      # @param member [Vapi::GoHighLevelCalendarEventCreateTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.gohighlevel_calendar_event_create(member:)
        new(member: member, discriminant: "gohighlevel.calendar.event.create")
      end
      # @param member [Vapi::GoHighLevelContactCreateTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.gohighlevel_contact_create(member:)
        new(member: member, discriminant: "gohighlevel.contact.create")
      end
      # @param member [Vapi::GoHighLevelContactGetTool] 
      # @return [Vapi::Tools::ToolsListResponseItem]
      def self.gohighlevel_contact_get(member:)
        new(member: member, discriminant: "gohighlevel.contact.get")
      end
    end
  end
end