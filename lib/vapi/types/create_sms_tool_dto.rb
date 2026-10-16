# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a tool that lets an assistant send an SMS message during a call.
    class CreateSmsToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateSmsToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
