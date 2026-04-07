# frozen_string_literal: true

module Vapi
  module Types
    class OpenRouterModelToolsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::CreateApiRequestToolDto }, key: "API_REQUEST"
      member -> { Vapi::Types::CreateBashToolDto }, key: "BASH"
      member -> { Vapi::Types::CreateCodeToolDto }, key: "CODE"
      member -> { Vapi::Types::CreateComputerToolDto }, key: "COMPUTER"
      member -> { Vapi::Types::CreateDtmfToolDto }, key: "DTMF"
      member -> { Vapi::Types::CreateEndCallToolDto }, key: "END_CALL"
      member -> { Vapi::Types::CreateFunctionToolDto }, key: "FUNCTION"
      member -> { Vapi::Types::CreateGoHighLevelCalendarAvailabilityToolDto }, key: "GOHIGHLEVEL_CALENDAR_AVAILABILITY_CHECK"
      member -> { Vapi::Types::CreateGoHighLevelCalendarEventCreateToolDto }, key: "GOHIGHLEVEL_CALENDAR_EVENT_CREATE"
      member -> { Vapi::Types::CreateGoHighLevelContactCreateToolDto }, key: "GOHIGHLEVEL_CONTACT_CREATE"
      member -> { Vapi::Types::CreateGoHighLevelContactGetToolDto }, key: "GOHIGHLEVEL_CONTACT_GET"
      member -> { Vapi::Types::CreateGoogleCalendarCheckAvailabilityToolDto }, key: "GOOGLE_CALENDAR_AVAILABILITY_CHECK"
      member -> { Vapi::Types::CreateGoogleCalendarCreateEventToolDto }, key: "GOOGLE_CALENDAR_EVENT_CREATE"
      member -> { Vapi::Types::CreateGoogleSheetsRowAppendToolDto }, key: "GOOGLE_SHEETS_ROW_APPEND"
      member -> { Vapi::Types::CreateHandoffToolDto }, key: "HANDOFF"
      member -> { Vapi::Types::CreateMcpToolDto }, key: "MCP"
      member -> { Vapi::Types::CreateQueryToolDto }, key: "QUERY"
      member -> { Vapi::Types::CreateSlackSendMessageToolDto }, key: "SLACK_MESSAGE_SEND"
      member -> { Vapi::Types::CreateSmsToolDto }, key: "SMS"
      member -> { Vapi::Types::CreateTextEditorToolDto }, key: "TEXT_EDITOR"
      member -> { Vapi::Types::CreateTransferCallToolDto }, key: "TRANSFER_CALL"
      member -> { Vapi::Types::CreateSipRequestToolDto }, key: "SIP_REQUEST"
      member -> { Vapi::Types::CreateVoicemailToolDto }, key: "VOICEMAIL"
    end
  end
end
