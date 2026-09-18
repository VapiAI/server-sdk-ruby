# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a handoff tool, including its destinations, function definition, default result, messages,
    # and rejection plan.
    class UpdateHandoffToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateHandoffToolDtoMessagesItem] }, optional: true, nullable: false
      field :default_result, -> { String }, optional: true, nullable: false, api_name: "defaultResult"
      field :destinations, -> { Internal::Types::Array[Vapi::Types::UpdateHandoffToolDtoDestinationsItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
    end
  end
end
