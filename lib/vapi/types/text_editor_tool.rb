# frozen_string_literal: true

module Vapi
  module Types
    class TextEditorTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::TextEditorToolMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::TextEditorToolSubType }, optional: false, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :name, -> { Vapi::Types::TextEditorToolName }, optional: false, nullable: false
    end
  end
end
