# frozen_string_literal: true

module Vapi
  module Types
    class UpdateKnowledgeBaseToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateKnowledgeBaseToolDtoMessagesItem] }, optional: true, nullable: false
      field :knowledge_base_id, -> { String }, optional: true, nullable: false, api_name: "knowledgeBaseId"
      field :function, -> { Vapi::Types::KnowledgeBaseToolFunction }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
