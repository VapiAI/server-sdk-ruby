# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a query tool, including its knowledge bases, spoken messages, and rejection plan.
    class UpdateQueryToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateQueryToolDtoMessagesItem] }, optional: true, nullable: false
      field :knowledge_bases, -> { Internal::Types::Array[Vapi::Types::KnowledgeBase] }, optional: true, nullable: false, api_name: "knowledgeBases"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
