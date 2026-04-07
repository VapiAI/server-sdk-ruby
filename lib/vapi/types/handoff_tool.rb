# frozen_string_literal: true

module Vapi
  module Types
    class HandoffTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::HandoffToolMessagesItem] }, optional: true, nullable: false
      field :default_result, -> { String }, optional: true, nullable: false, api_name: "defaultResult"
      field :destinations, -> { Internal::Types::Array[Vapi::Types::HandoffToolDestinationsItem] }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
    end
  end
end
