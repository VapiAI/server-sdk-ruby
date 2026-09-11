# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a tool that reads and edits text files in a configured environment.
    class CreateTextEditorToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateTextEditorToolDtoMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::CreateTextEditorToolDtoSubType }, optional: false, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :name, -> { Vapi::Types::CreateTextEditorToolDtoName }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
