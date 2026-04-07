# frozen_string_literal: true

module Vapi
  module Types
    class CreateTransferCallToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateTransferCallToolDtoMessagesItem] }, optional: true, nullable: false
      field :destinations, -> { Internal::Types::Array[Vapi::Types::CreateTransferCallToolDtoDestinationsItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
