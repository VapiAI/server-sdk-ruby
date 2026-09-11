# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a tool that transfers the active call to one of its configured destinations.
    class CreateTransferCallToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateTransferCallToolDtoMessagesItem] }, optional: true, nullable: false
      field :destinations, -> { Internal::Types::Array[Vapi::Types::CreateTransferCallToolDtoDestinationsItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
