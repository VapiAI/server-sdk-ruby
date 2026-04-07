# frozen_string_literal: true

module Vapi
  module Types
    class ComputerTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::ComputerToolMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::ComputerToolSubType }, optional: false, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :name, -> { Vapi::Types::ComputerToolName }, optional: false, nullable: false
      field :display_width_px, -> { Integer }, optional: false, nullable: false, api_name: "displayWidthPx"
      field :display_height_px, -> { Integer }, optional: false, nullable: false, api_name: "displayHeightPx"
      field :display_number, -> { Integer }, optional: true, nullable: false, api_name: "displayNumber"
    end
  end
end
