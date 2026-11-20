# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingSuiteCoverageDto < Internal::Types::Model
      field :covered, -> { Integer }, optional: false, nullable: false
      field :total, -> { Integer }, optional: false, nullable: false
      field :gaps, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingCoverageGapDto] }, optional: false, nullable: false
      field :retryable, -> { Integer }, optional: false, nullable: false
    end
  end
end
