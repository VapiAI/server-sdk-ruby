# frozen_string_literal: true

module Vapi
  module Types
    class UpdateComputerToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateComputerToolDtoMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::UpdateComputerToolDtoSubType }, optional: true, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :name, -> { Vapi::Types::UpdateComputerToolDtoName }, optional: true, nullable: false
      field :display_width_px, -> { Integer }, optional: true, nullable: false, api_name: "displayWidthPx"
      field :display_height_px, -> { Integer }, optional: true, nullable: false, api_name: "displayHeightPx"
      field :display_number, -> { Integer }, optional: true, nullable: false, api_name: "displayNumber"
    end
  end
end
