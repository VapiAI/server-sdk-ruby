# frozen_string_literal: true

module Vapi
  module Tools
    module Types
      class UpdateToolsRequestBody < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::UpdateApiRequestToolDto }, key: "API_REQUEST"
        member -> { Vapi::Types::UpdateDtmfToolDto }, key: "DTMF"
        member -> { Vapi::Types::UpdateEndCallToolDto }, key: "END_CALL"
        member -> { Vapi::Types::UpdateFunctionToolDto }, key: "FUNCTION"
        member -> { Vapi::Types::UpdateTransferCallToolDto }, key: "TRANSFER_CALL"
        member -> { Vapi::Types::UpdateHandoffToolDto }, key: "HANDOFF"
        member -> { Vapi::Types::UpdateBashToolDto }, key: "BASH"
        member -> { Vapi::Types::UpdateComputerToolDto }, key: "COMPUTER"
        member -> { Vapi::Types::UpdateTextEditorToolDto }, key: "TEXT_EDITOR"
        member -> { Vapi::Types::UpdateQueryToolDto }, key: "QUERY"
        member -> { Vapi::Types::UpdateGoogleCalendarCreateEventToolDto }, key: "GOOGLE_CALENDAR_EVENT_CREATE"
        member -> { Vapi::Types::UpdateGoogleSheetsRowAppendToolDto }, key: "GOOGLE_SHEETS_ROW_APPEND"
        member -> { Vapi::Types::UpdateGoogleCalendarCheckAvailabilityToolDto }, key: "GOOGLE_CALENDAR_AVAILABILITY_CHECK"
        member -> { Vapi::Types::UpdateSlackSendMessageToolDto }, key: "SLACK_MESSAGE_SEND"
        member -> { Vapi::Types::UpdateSmsToolDto }, key: "SMS"
        member -> { Vapi::Types::UpdateMcpToolDto }, key: "MCP"
        member -> { Vapi::Types::UpdateGoHighLevelCalendarAvailabilityToolDto }, key: "GOHIGHLEVEL_CALENDAR_AVAILABILITY_CHECK"
        member -> { Vapi::Types::UpdateGoHighLevelCalendarEventCreateToolDto }, key: "GOHIGHLEVEL_CALENDAR_EVENT_CREATE"
        member -> { Vapi::Types::UpdateGoHighLevelContactCreateToolDto }, key: "GOHIGHLEVEL_CONTACT_CREATE"
        member -> { Vapi::Types::UpdateGoHighLevelContactGetToolDto }, key: "GOHIGHLEVEL_CONTACT_GET"
        member -> { Vapi::Types::UpdateSipRequestToolDto }, key: "SIP_REQUEST"
        member -> { Vapi::Types::UpdateVoicemailToolDto }, key: "VOICEMAIL"
      end
    end
  end
end
