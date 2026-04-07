# frozen_string_literal: true

module Vapi
  module Types
    class CreateToolTemplateDtoProviderDetails < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::MakeToolProviderDetails }, key: "MAKE"
      member -> { Vapi::Types::GhlToolProviderDetails }, key: "GHL"
      member -> { Vapi::Types::FunctionToolProviderDetails }, key: "FUNCTION"
      member -> { Vapi::Types::GoogleCalendarCreateEventToolProviderDetails }, key: "GOOGLE_CALENDAR_EVENT_CREATE"
      member -> { Vapi::Types::GoogleSheetsRowAppendToolProviderDetails }, key: "GOOGLE_SHEETS_ROW_APPEND"
      member -> { Vapi::Types::GoHighLevelCalendarAvailabilityToolProviderDetails }, key: "GOHIGHLEVEL_CALENDAR_AVAILABILITY_CHECK"
      member -> { Vapi::Types::GoHighLevelCalendarEventCreateToolProviderDetails }, key: "GOHIGHLEVEL_CALENDAR_EVENT_CREATE"
      member -> { Vapi::Types::GoHighLevelContactCreateToolProviderDetails }, key: "GOHIGHLEVEL_CONTACT_CREATE"
      member -> { Vapi::Types::GoHighLevelContactGetToolProviderDetails }, key: "GOHIGHLEVEL_CONTACT_GET"
    end
  end
end
