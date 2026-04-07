# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageToolCallsToolWithToolCallListItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::FunctionToolWithToolCall }, key: "FUNCTION"
      member -> { Vapi::Types::GhlToolWithToolCall }, key: "GHL"
      member -> { Vapi::Types::MakeToolWithToolCall }, key: "MAKE"
      member -> { Vapi::Types::BashToolWithToolCall }, key: "BASH"
      member -> { Vapi::Types::ComputerToolWithToolCall }, key: "COMPUTER"
      member -> { Vapi::Types::TextEditorToolWithToolCall }, key: "TEXT_EDITOR"
      member -> { Vapi::Types::GoogleCalendarCreateEventToolWithToolCall }, key: "GOOGLE_CALENDAR_EVENT_CREATE"
    end
  end
end
