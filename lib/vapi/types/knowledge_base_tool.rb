# frozen_string_literal: true

module Vapi
  module Types
    class KnowledgeBaseTool < Internal::Types::Model
      field :latest_version, -> { String }, optional: true, nullable: false, api_name: "latestVersion"
      field :messages, -> { Internal::Types::Array[Vapi::Types::KnowledgeBaseToolMessagesItem] }, optional: true, nullable: false
      field :knowledge_base_id, -> { String }, optional: false, nullable: true, api_name: "knowledgeBaseId"
      field :function, -> { Vapi::Types::KnowledgeBaseToolFunction }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
