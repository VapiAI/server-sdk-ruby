# frozen_string_literal: true

module Vapi
  module Types
    class HandoffDestinationAssistant < Internal::Types::Model
      field :type, -> { Vapi::Types::HandoffDestinationAssistantType }, optional: false, nullable: false
      field :context_engineering_plan, -> { Vapi::Types::HandoffDestinationAssistantContextEngineeringPlan }, optional: true, nullable: false, api_name: "contextEngineeringPlan"
      field :assistant_name, -> { String }, optional: true, nullable: false, api_name: "assistantName"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
