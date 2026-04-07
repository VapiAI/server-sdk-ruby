# frozen_string_literal: true

module Vapi
  module Types
    class SimulationConcurrencyResponse < Internal::Types::Model
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :concurrency_limit, -> { Integer }, optional: false, nullable: false, api_name: "concurrencyLimit"
      field :active_simulations, -> { Integer }, optional: false, nullable: false, api_name: "activeSimulations"
      field :available_to_start, -> { Integer }, optional: false, nullable: false, api_name: "availableToStart"
      field :created_at, -> { String }, optional: false, nullable: true, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: true, api_name: "updatedAt"
      field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isDefault"
    end
  end
end
