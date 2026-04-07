# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTransferCallToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateTransferCallToolDtoMessagesItem] }, optional: true, nullable: false
      field :destinations, -> { Internal::Types::Array[Vapi::Types::UpdateTransferCallToolDtoDestinationsItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
