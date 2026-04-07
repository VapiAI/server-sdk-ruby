# frozen_string_literal: true

module Vapi
  module Types
    class CreateGhlToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateGhlToolDtoMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::CreateGhlToolDtoType }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::GhlToolMetadata }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
