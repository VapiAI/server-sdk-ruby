# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingSuiteViewDto < Internal::Types::Model
      field :suite, -> { Vapi::Types::SimulationOnboardingSuiteRefDto }, optional: false, nullable: false
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :simulations, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingSuiteSimulationDto] }, optional: false, nullable: false
      field :coverage, -> { Vapi::Types::SimulationOnboardingSuiteCoverageDto }, optional: false, nullable: false
      field :requirements, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingRequirementDto] }, optional: false, nullable: false
      field :docs, -> { Vapi::Types::SimulationOnboardingSuiteDocsDto }, optional: false, nullable: false
      field :reused, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :failed_edit_simulation_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "failedEditSimulationIds"
      field :tool_gaps, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingToolGapDto] }, optional: true, nullable: false, api_name: "toolGaps"
    end
  end
end
