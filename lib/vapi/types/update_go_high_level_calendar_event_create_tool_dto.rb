# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a GoHighLevel calendar-event tool, including its spoken messages and rejection plan.
    class UpdateGoHighLevelCalendarEventCreateToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateGoHighLevelCalendarEventCreateToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
