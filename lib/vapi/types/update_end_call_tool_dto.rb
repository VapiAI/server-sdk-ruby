# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update an end-call tool, including its spoken messages and rejection plan.
    class UpdateEndCallToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateEndCallToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
