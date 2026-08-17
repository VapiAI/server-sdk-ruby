# frozen_string_literal: true

module Vapi
  module Types
    class UpdateMakeToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateMakeToolDtoMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::UpdateMakeToolDtoType }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :metadata, -> { Vapi::Types::MakeToolMetadata }, optional: true, nullable: false
    end
  end
end
