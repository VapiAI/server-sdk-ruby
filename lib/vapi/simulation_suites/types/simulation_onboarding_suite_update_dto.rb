# frozen_string_literal: true

module Vapi
  module SimulationSuites
    module Types
      class SimulationOnboardingSuiteUpdateDto < Internal::Types::Model
        field :suite_id, -> { String }, optional: false, nullable: false, api_name: "suiteId"
        field :patch_key, -> { String }, optional: false, nullable: false, api_name: "patchKey"
        field :remove_simulation_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "removeSimulationIds"
        field :edits, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingSuiteEditDto] }, optional: true, nullable: false
        field :retry_failed, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "retryFailed"
      end
    end
  end
end
