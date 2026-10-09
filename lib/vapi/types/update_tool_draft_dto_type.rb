# frozen_string_literal: true

module Vapi
  module Types
    module UpdateToolDraftDtoType
      extend Vapi::Internal::Types::Enum

      DTMF = "dtmf"
      END_CALL = "endCall"
      KNOWLEDGE_BASE = "knowledgeBase"
      TRANSFER_CALL = "transferCall"
      TRANSFER_CANCEL = "transferCancel"
      TRANSFER_SUCCESSFUL = "transferSuccessful"
      HANDOFF = "handoff"
      OUTPUT = "output"
      VOICEMAIL = "voicemail"
      QUERY = "query"
      SMS = "sms"
      SIP_REQUEST = "sipRequest"
      FUNCTION = "function"
      MCP = "mcp"
      API_REQUEST = "apiRequest"
      CODE = "code"
      BASH = "bash"
      COMPUTER = "computer"
      TEXT_EDITOR = "textEditor"
      GOOGLE_CALENDAR_EVENT_CREATE = "google.calendar.event.create"
      GOOGLE_CALENDAR_AVAILABILITY_CHECK = "google.calendar.availability.check"
      GOOGLE_SHEETS_ROW_APPEND = "google.sheets.row.append"
      SLACK_MESSAGE_SEND = "slack.message.send"
      GOHIGHLEVEL_CALENDAR_EVENT_CREATE = "gohighlevel.calendar.event.create"
      GOHIGHLEVEL_CALENDAR_AVAILABILITY_CHECK = "gohighlevel.calendar.availability.check"
      GOHIGHLEVEL_CONTACT_CREATE = "gohighlevel.contact.create"
      GOHIGHLEVEL_CONTACT_GET = "gohighlevel.contact.get"
      MAKE = "make"
      GHL = "ghl"
    end
  end
end
