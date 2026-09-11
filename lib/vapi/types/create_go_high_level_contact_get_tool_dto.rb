# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a tool that retrieves contacts from a connected GoHighLevel account.
    class CreateGoHighLevelContactGetToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateGoHighLevelContactGetToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
