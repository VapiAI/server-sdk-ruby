# frozen_string_literal: true

module Vapi
  module Types
    class CreateScenarioDto < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :instructions, -> { String }, optional: false, nullable: false
      field :evaluations, -> { Internal::Types::Array[Vapi::Types::EvaluationPlanItem] }, optional: false, nullable: false
      field :hooks, -> { Internal::Types::Array[Vapi::Types::CreateScenarioDtoHooksItem] }, optional: true, nullable: false
      field :target_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "targetOverrides"
      field :tool_mocks, -> { Internal::Types::Array[Vapi::Types::ScenarioToolMock] }, optional: true, nullable: false, api_name: "toolMocks"
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
