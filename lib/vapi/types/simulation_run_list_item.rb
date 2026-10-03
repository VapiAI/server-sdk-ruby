# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunListItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :status, -> { Vapi::Types::SimulationRunListItemStatus }, optional: false, nullable: false
      field :queued_at, -> { String }, optional: false, nullable: false, api_name: "queuedAt"
      field :started_at, -> { String }, optional: true, nullable: false, api_name: "startedAt"
      field :ended_at, -> { String }, optional: true, nullable: false, api_name: "endedAt"
      field :ended_reason, -> { String }, optional: true, nullable: false, api_name: "endedReason"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :item_counts, -> { Vapi::Types::SimulationRunItemCounts }, optional: true, nullable: false, api_name: "itemCounts"
      field :simulations, -> { Internal::Types::Array[Vapi::Types::SimulationRunListItemSimulationsItem] }, optional: false, nullable: false
      field :target, -> { Vapi::Types::SimulationRunListItemTarget }, optional: false, nullable: false
      field :iterations, -> { Integer }, optional: true, nullable: false
      field :transport, -> { Vapi::Types::SimulationRunTransportConfiguration }, optional: true, nullable: false
      field :summary, -> { Vapi::Types::SimulationRunListSummary }, optional: false, nullable: false
    end
  end
end
