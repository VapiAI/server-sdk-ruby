# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingRequirementDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :tag, -> { Vapi::Types::SimulationOnboardingRequirementDtoTag }, optional: true, nullable: false
      field :note, -> { String }, optional: true, nullable: false
    end
  end
end
