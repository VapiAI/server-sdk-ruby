# frozen_string_literal: true

require "json"
require_relative "../../types/update_api_request_tool_dto"
require_relative "../../types/update_dtmf_tool_dto"
require_relative "../../types/update_end_call_tool_dto"
require_relative "../../types/update_function_tool_dto"
require_relative "../../types/update_ghl_tool_dto"
require_relative "../../types/update_make_tool_dto"
require_relative "../../types/update_transfer_call_tool_dto"
require_relative "../../types/update_output_tool_dto"
require_relative "../../types/update_bash_tool_dto"
require_relative "../../types/update_computer_tool_dto"
require_relative "../../types/update_text_editor_tool_dto"
require_relative "../../types/update_query_tool_dto"
require_relative "../../types/update_google_calendar_create_event_tool_dto"
require_relative "../../types/update_google_sheets_row_append_tool_dto"
require_relative "../../types/update_google_calendar_check_availability_tool_dto"
require_relative "../../types/update_slack_send_message_tool_dto"
require_relative "../../types/update_sms_tool_dto"
require_relative "../../types/update_mcp_tool_dto"
require_relative "../../types/update_go_high_level_calendar_availability_tool_dto"
require_relative "../../types/update_go_high_level_calendar_event_create_tool_dto"
require_relative "../../types/update_go_high_level_contact_create_tool_dto"
require_relative "../../types/update_go_high_level_contact_get_tool_dto"

module Vapi
  class Tools
    class ToolsUpdateRequest
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of ToolsUpdateRequest
      #
      # @param json_object [String]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "apiRequest"
                   Vapi::UpdateApiRequestToolDto.from_json(json_object: json_object)
                 when "dtmf"
                   Vapi::UpdateDtmfToolDto.from_json(json_object: json_object)
                 when "endCall"
                   Vapi::UpdateEndCallToolDto.from_json(json_object: json_object)
                 when "function"
                   Vapi::UpdateFunctionToolDto.from_json(json_object: json_object)
                 when "ghl"
                   Vapi::UpdateGhlToolDto.from_json(json_object: json_object)
                 when "make"
                   Vapi::UpdateMakeToolDto.from_json(json_object: json_object)
                 when "transferCall"
                   Vapi::UpdateTransferCallToolDto.from_json(json_object: json_object)
                 when "output"
                   Vapi::UpdateOutputToolDto.from_json(json_object: json_object)
                 when "bash"
                   Vapi::UpdateBashToolDto.from_json(json_object: json_object)
                 when "computer"
                   Vapi::UpdateComputerToolDto.from_json(json_object: json_object)
                 when "textEditor"
                   Vapi::UpdateTextEditorToolDto.from_json(json_object: json_object)
                 when "query"
                   Vapi::UpdateQueryToolDto.from_json(json_object: json_object)
                 when "google.calendar.event.create"
                   Vapi::UpdateGoogleCalendarCreateEventToolDto.from_json(json_object: json_object)
                 when "google.sheets.row.append"
                   Vapi::UpdateGoogleSheetsRowAppendToolDto.from_json(json_object: json_object)
                 when "google.calendar.availability.check"
                   Vapi::UpdateGoogleCalendarCheckAvailabilityToolDto.from_json(json_object: json_object)
                 when "slack.message.send"
                   Vapi::UpdateSlackSendMessageToolDto.from_json(json_object: json_object)
                 when "sms"
                   Vapi::UpdateSmsToolDto.from_json(json_object: json_object)
                 when "mcp"
                   Vapi::UpdateMcpToolDto.from_json(json_object: json_object)
                 when "gohighlevel.calendar.availability.check"
                   Vapi::UpdateGoHighLevelCalendarAvailabilityToolDto.from_json(json_object: json_object)
                 when "gohighlevel.calendar.event.create"
                   Vapi::UpdateGoHighLevelCalendarEventCreateToolDto.from_json(json_object: json_object)
                 when "gohighlevel.contact.create"
                   Vapi::UpdateGoHighLevelContactCreateToolDto.from_json(json_object: json_object)
                 when "gohighlevel.contact.get"
                   Vapi::UpdateGoHighLevelContactGetToolDto.from_json(json_object: json_object)
                 else
                   Vapi::UpdateApiRequestToolDto.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "apiRequest"
          { **@member.to_json, type: @discriminant }.to_json
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
        when "apiRequest"
          Vapi::UpdateApiRequestToolDto.validate_raw(obj: obj)
        when "dtmf"
          Vapi::UpdateDtmfToolDto.validate_raw(obj: obj)
        when "endCall"
          Vapi::UpdateEndCallToolDto.validate_raw(obj: obj)
        when "function"
          Vapi::UpdateFunctionToolDto.validate_raw(obj: obj)
        when "ghl"
          Vapi::UpdateGhlToolDto.validate_raw(obj: obj)
        when "make"
          Vapi::UpdateMakeToolDto.validate_raw(obj: obj)
        when "transferCall"
          Vapi::UpdateTransferCallToolDto.validate_raw(obj: obj)
        when "output"
          Vapi::UpdateOutputToolDto.validate_raw(obj: obj)
        when "bash"
          Vapi::UpdateBashToolDto.validate_raw(obj: obj)
        when "computer"
          Vapi::UpdateComputerToolDto.validate_raw(obj: obj)
        when "textEditor"
          Vapi::UpdateTextEditorToolDto.validate_raw(obj: obj)
        when "query"
          Vapi::UpdateQueryToolDto.validate_raw(obj: obj)
        when "google.calendar.event.create"
          Vapi::UpdateGoogleCalendarCreateEventToolDto.validate_raw(obj: obj)
        when "google.sheets.row.append"
          Vapi::UpdateGoogleSheetsRowAppendToolDto.validate_raw(obj: obj)
        when "google.calendar.availability.check"
          Vapi::UpdateGoogleCalendarCheckAvailabilityToolDto.validate_raw(obj: obj)
        when "slack.message.send"
          Vapi::UpdateSlackSendMessageToolDto.validate_raw(obj: obj)
        when "sms"
          Vapi::UpdateSmsToolDto.validate_raw(obj: obj)
        when "mcp"
          Vapi::UpdateMcpToolDto.validate_raw(obj: obj)
        when "gohighlevel.calendar.availability.check"
          Vapi::UpdateGoHighLevelCalendarAvailabilityToolDto.validate_raw(obj: obj)
        when "gohighlevel.calendar.event.create"
          Vapi::UpdateGoHighLevelCalendarEventCreateToolDto.validate_raw(obj: obj)
        when "gohighlevel.contact.create"
          Vapi::UpdateGoHighLevelContactCreateToolDto.validate_raw(obj: obj)
        when "gohighlevel.contact.get"
          Vapi::UpdateGoHighLevelContactGetToolDto.validate_raw(obj: obj)
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

      # @param member [Vapi::UpdateApiRequestToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.api_request(member:)
        new(member: member, discriminant: "apiRequest")
      end

      # @param member [Vapi::UpdateDtmfToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.dtmf(member:)
        new(member: member, discriminant: "dtmf")
      end

      # @param member [Vapi::UpdateEndCallToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.end_call(member:)
        new(member: member, discriminant: "endCall")
      end

      # @param member [Vapi::UpdateFunctionToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.function(member:)
        new(member: member, discriminant: "function")
      end

      # @param member [Vapi::UpdateGhlToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.ghl(member:)
        new(member: member, discriminant: "ghl")
      end

      # @param member [Vapi::UpdateMakeToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.make(member:)
        new(member: member, discriminant: "make")
      end

      # @param member [Vapi::UpdateTransferCallToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.transfer_call(member:)
        new(member: member, discriminant: "transferCall")
      end

      # @param member [Vapi::UpdateOutputToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.output(member:)
        new(member: member, discriminant: "output")
      end

      # @param member [Vapi::UpdateBashToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.bash(member:)
        new(member: member, discriminant: "bash")
      end

      # @param member [Vapi::UpdateComputerToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.computer(member:)
        new(member: member, discriminant: "computer")
      end

      # @param member [Vapi::UpdateTextEditorToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.text_editor(member:)
        new(member: member, discriminant: "textEditor")
      end

      # @param member [Vapi::UpdateQueryToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.query(member:)
        new(member: member, discriminant: "query")
      end

      # @param member [Vapi::UpdateGoogleCalendarCreateEventToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.google_calendar_event_create(member:)
        new(member: member, discriminant: "google.calendar.event.create")
      end

      # @param member [Vapi::UpdateGoogleSheetsRowAppendToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.google_sheets_row_append(member:)
        new(member: member, discriminant: "google.sheets.row.append")
      end

      # @param member [Vapi::UpdateGoogleCalendarCheckAvailabilityToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.google_calendar_availability_check(member:)
        new(member: member, discriminant: "google.calendar.availability.check")
      end

      # @param member [Vapi::UpdateSlackSendMessageToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.slack_message_send(member:)
        new(member: member, discriminant: "slack.message.send")
      end

      # @param member [Vapi::UpdateSmsToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.sms(member:)
        new(member: member, discriminant: "sms")
      end

      # @param member [Vapi::UpdateMcpToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.mcp(member:)
        new(member: member, discriminant: "mcp")
      end

      # @param member [Vapi::UpdateGoHighLevelCalendarAvailabilityToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.gohighlevel_calendar_availability_check(member:)
        new(member: member, discriminant: "gohighlevel.calendar.availability.check")
      end

      # @param member [Vapi::UpdateGoHighLevelCalendarEventCreateToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.gohighlevel_calendar_event_create(member:)
        new(member: member, discriminant: "gohighlevel.calendar.event.create")
      end

      # @param member [Vapi::UpdateGoHighLevelContactCreateToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.gohighlevel_contact_create(member:)
        new(member: member, discriminant: "gohighlevel.contact.create")
      end

      # @param member [Vapi::UpdateGoHighLevelContactGetToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.gohighlevel_contact_get(member:)
        new(member: member, discriminant: "gohighlevel.contact.get")
      end
    end
  end
end
