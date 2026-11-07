# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingOpenQuestionDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :why, -> { String }, optional: false, nullable: false
    end
  end
end
