# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingCoverageGapDto < Internal::Types::Model
      field :requirement_id, -> { String }, optional: false, nullable: false, api_name: "requirementId"
      field :reason, -> { Vapi::Types::SimulationOnboardingCoverageGapDtoReason }, optional: false, nullable: false
      field :detail, -> { String }, optional: true, nullable: false
    end
  end
end
