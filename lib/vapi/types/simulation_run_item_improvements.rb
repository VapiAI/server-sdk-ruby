# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemImprovements < Internal::Types::Model
      field :analysis, -> { String }, optional: false, nullable: false
      field :system_prompt_suggestions, -> { Internal::Types::Array[Vapi::Types::SimulationRunItemImprovementSuggestion] }, optional: false, nullable: false, api_name: "systemPromptSuggestions"
      field :tool_suggestions, -> { Internal::Types::Array[Vapi::Types::SimulationRunItemImprovementSuggestion] }, optional: false, nullable: false, api_name: "toolSuggestions"
      field :scenario_suggestions, -> { Internal::Types::Array[Vapi::Types::SimulationRunItemImprovementSuggestion] }, optional: false, nullable: false, api_name: "scenarioSuggestions"
      field :suggested_system_prompt, -> { String }, optional: true, nullable: false, api_name: "suggestedSystemPrompt"
    end
  end
end
