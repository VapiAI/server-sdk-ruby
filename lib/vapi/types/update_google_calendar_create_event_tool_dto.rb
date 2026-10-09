# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a Google Calendar event-creation tool, including its spoken messages and rejection plan.
    class UpdateGoogleCalendarCreateEventToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateGoogleCalendarCreateEventToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
