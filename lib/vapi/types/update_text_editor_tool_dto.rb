# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTextEditorToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateTextEditorToolDtoMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::UpdateTextEditorToolDtoSubType }, optional: true, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :name, -> { Vapi::Types::UpdateTextEditorToolDtoName }, optional: true, nullable: false
    end
  end
end
