# frozen_string_literal: true

module Vapi
  module Types
    class GhlTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::GhlToolMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::GhlToolType }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :metadata, -> { Vapi::Types::GhlToolMetadata }, optional: false, nullable: false
    end
  end
end
