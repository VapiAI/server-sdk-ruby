# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemImprovementSuggestion < Internal::Types::Model
      field :issue, -> { String }, optional: false, nullable: false
      field :suggestion, -> { String }, optional: false, nullable: false
    end
  end
end
