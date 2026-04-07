# frozen_string_literal: true

module Vapi
  module Tools
    module Types
      class UpdateToolsResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::ApiRequestTool }, key: "API_REQUEST"
        member -> { Vapi::Types::CodeTool }, key: "CODE"
        member -> { Vapi::Types::DtmfTool }, key: "DTMF"
        member -> { Vapi::Types::EndCallTool }, key: "END_CALL"
        member -> { Vapi::Types::FunctionTool }, key: "FUNCTION"
        member -> { Vapi::Types::TransferCallTool }, key: "TRANSFER_CALL"
        member -> { Vapi::Types::HandoffTool }, key: "HANDOFF"
        member -> { Vapi::Types::BashTool }, key: "BASH"
        member -> { Vapi::Types::ComputerTool }, key: "COMPUTER"
        member -> { Vapi::Types::TextEditorTool }, key: "TEXT_EDITOR"
        member -> { Vapi::Types::QueryTool }, key: "QUERY"
        member -> { Vapi::Types::GoogleCalendarCreateEventTool }, key: "GOOGLE_CALENDAR_EVENT_CREATE"
        member -> { Vapi::Types::GoogleSheetsRowAppendTool }, key: "GOOGLE_SHEETS_ROW_APPEND"
        member -> { Vapi::Types::GoogleCalendarCheckAvailabilityTool }, key: "GOOGLE_CALENDAR_AVAILABILITY_CHECK"
        member -> { Vapi::Types::SlackSendMessageTool }, key: "SLACK_MESSAGE_SEND"
        member -> { Vapi::Types::SmsTool }, key: "SMS"
        member -> { Vapi::Types::McpTool }, key: "MCP"
        member -> { Vapi::Types::GoHighLevelCalendarAvailabilityTool }, key: "GOHIGHLEVEL_CALENDAR_AVAILABILITY_CHECK"
        member -> { Vapi::Types::GoHighLevelCalendarEventCreateTool }, key: "GOHIGHLEVEL_CALENDAR_EVENT_CREATE"
        member -> { Vapi::Types::GoHighLevelContactCreateTool }, key: "GOHIGHLEVEL_CONTACT_CREATE"
        member -> { Vapi::Types::GoHighLevelContactGetTool }, key: "GOHIGHLEVEL_CONTACT_GET"
        member -> { Vapi::Types::SipRequestTool }, key: "SIP_REQUEST"
        member -> { Vapi::Types::VoicemailTool }, key: "VOICEMAIL"
      end
    end
  end
end
