# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a tool that lets an assistant send a message to Slack.
    class CreateSlackSendMessageToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateSlackSendMessageToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
