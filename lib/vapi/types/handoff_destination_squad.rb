# frozen_string_literal: true

module Vapi
  module Types
    # Routes a handoff to a saved or transient squad, with optional entry assistant, context engineering, variable
    # extraction, and overrides.
    class HandoffDestinationSquad < Internal::Types::Model
      field :context_engineering_plan, -> { Vapi::Types::HandoffDestinationSquadContextEngineeringPlan }, optional: true, nullable: false, api_name: "contextEngineeringPlan"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :entry_assistant_name, -> { String }, optional: true, nullable: false, api_name: "entryAssistantName"
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
