# frozen_string_literal: true

module Vapi
  module Types
    class UpdateGoHighLevelCalendarAvailabilityToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateGoHighLevelCalendarAvailabilityToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
