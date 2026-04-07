# frozen_string_literal: true

module Vapi
  module Types
    class UpdateGhlToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateGhlToolDtoMessagesItem] }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :metadata, -> { Vapi::Types::GhlToolMetadata }, optional: true, nullable: false
    end
  end
end
