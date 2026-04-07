# frozen_string_literal: true

module Vapi
  module Types
    class Scenario < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :instructions, -> { String }, optional: false, nullable: false
      field :evaluations, -> { Internal::Types::Array[Vapi::Types::EvaluationPlanItem] }, optional: false, nullable: false
      field :hooks, -> { Internal::Types::Array[Vapi::Types::ScenarioHooksItem] }, optional: true, nullable: false
      field :target_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "targetOverrides"
      field :tool_mocks, -> { Internal::Types::Array[Vapi::Types::ScenarioToolMock] }, optional: true, nullable: false, api_name: "toolMocks"
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
