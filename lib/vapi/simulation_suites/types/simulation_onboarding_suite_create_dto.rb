# frozen_string_literal: true

module Vapi
  module SimulationSuites
    module Types
      class SimulationOnboardingSuiteCreateDto < Internal::Types::Model
        field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "idempotencyKey"
        field :requirements, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingRequirementDto] }, optional: false, nullable: false
      end
    end
  end
end
