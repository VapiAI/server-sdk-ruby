# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingRequirementsDraftDto < Internal::Types::Model
      field :version, -> { Integer }, optional: false, nullable: false
      field :change_note, -> { String }, optional: true, nullable: false, api_name: "changeNote"
      field :sources, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :requirements, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingRequirementDto] }, optional: false, nullable: false
      field :open_questions, -> { Internal::Types::Array[Vapi::Types::SimulationOnboardingOpenQuestionDto] }, optional: false, nullable: false, api_name: "openQuestions"
    end
  end
end
