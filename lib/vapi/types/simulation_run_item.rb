# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :simulation_id, -> { String }, optional: false, nullable: false, api_name: "simulationId"
      field :status, -> { Vapi::Types::SimulationRunItemStatus }, optional: false, nullable: false
      field :queued_at, -> { String }, optional: false, nullable: false, api_name: "queuedAt"
      field :started_at, -> { String }, optional: true, nullable: false, api_name: "startedAt"
      field :completed_at, -> { String }, optional: true, nullable: false, api_name: "completedAt"
      field :failed_at, -> { String }, optional: true, nullable: false, api_name: "failedAt"
      field :canceled_at, -> { String }, optional: true, nullable: false, api_name: "canceledAt"
      field :failure_reason, -> { String }, optional: true, nullable: false, api_name: "failureReason"
      field :call_id, -> { String }, optional: true, nullable: false, api_name: "callId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :run_id, -> { String }, optional: true, nullable: false, api_name: "runId"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::SimulationRunItemHooksItem] }, optional: true, nullable: false
      field :iteration_number, -> { Integer }, optional: true, nullable: false, api_name: "iterationNumber"
      field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
      field :scenario_id, -> { String }, optional: true, nullable: false, api_name: "scenarioId"
      field :personality_id, -> { String }, optional: true, nullable: false, api_name: "personalityId"
      field :metadata, -> { Vapi::Types::SimulationRunItemMetadata }, optional: true, nullable: false
      field :results, -> { Vapi::Types::SimulationRunItemResults }, optional: true, nullable: false
      field :improvement_suggestions, -> { Vapi::Types::SimulationRunItemImprovements }, optional: true, nullable: false, api_name: "improvementSuggestions"
      field :configurations, -> { Vapi::Types::SimulationRunConfiguration }, optional: true, nullable: false
    end
  end
end
