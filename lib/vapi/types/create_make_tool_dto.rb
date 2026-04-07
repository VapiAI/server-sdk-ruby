# frozen_string_literal: true

module Vapi
  module Types
    class CreateMakeToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateMakeToolDtoMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::CreateMakeToolDtoType }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::MakeToolMetadata }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
