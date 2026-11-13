# frozen_string_literal: true

module Vapi
  module SimulationSuites
    module Types
      class SimulationOnboardingRequirementsCreateDto < Internal::Types::Model
        field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
        field :previous_draft, -> { Vapi::Types::SimulationOnboardingRequirementsDraftDto }, optional: true, nullable: false, api_name: "previousDraft"
        field :feedback, -> { String }, optional: true, nullable: false
      end
    end
  end
end
